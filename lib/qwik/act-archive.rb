$LOAD_PATH << 'compat' unless $LOAD_PATH.include? 'compat'
begin
  require 'zip/zip'
  $have_zip = true
rescue LoadError
  $have_zip = false
end

$LOAD_PATH << '..' unless $LOAD_PATH.include? '..'
require 'qwik/act-presen'
require 'qwik/act-theme'

module Qwik
  class Action
    D_ext_archive = {
      :dt => 'Site archive',
      :dd => 'You can obtain a site archive.',
      :dc => "* Example
{{zip}}

You can get an archive which contains all text files of this Wiki site.

The archive also contains static HTML files of the all Wiki pages.
If you place the HTML files on your Web site, it will be a simple
static Web site.
"
    }

    Dja_ext_archive = {
      :dt => 'サイト・アーカイブ',
      :dd => 'サイト・アーカイブを取得できます。',
      :dc => '* 使い方
{{zip}}

このリンクをクリックすると、サイトの内容をまるごと一つのアーカイブにま
とめて、ローカルに保存できます。

ファイルには、元となるテキストファイルだけではなく、静的なHTMLページも
保持しており、解凍してWebサイトに置けば、そのまま普通のWebページとして
公開できます。
'
    }

    def plg_zip
      return page_attribute('zip', _('site archive'), @site.sitename)
    end

    def ext_zip
      c_require_member
      c_require_base_is_sitename
      path = ZipGenerator.generate(@config, @site, self)
      return c_simple_send(path, 'application/zip')
    end
  end

  class ZipGenerator
    def self.generate(config, site, action)
      sitename = site.sitename
      site_cache_path = site.cache_path
      site_cache_path.check_directory

      zip_file = "#{sitename}.zip"
      zip_path = site_cache_path + zip_file

      Zip::ZipOutputStream.open(zip_path.to_s) {|zos|
	site.each_all {|page|
	  add_page(config, site, action, zos, site_cache_path, page)
	}
	add_theme(config, site, action, zos)
      }

      return zip_path
    end

    private

    def self.add_page(config, site, action, zos, site_cache_path, page)
      base = "#{site.sitename}/#{page.key}"
      add_txt(zos, base, page)

      # Generate html files.
      html_path = site_cache_path+"#{page.key}.html"
      action.view_page_cache_generate(page.key) if ! html_path.exist?
      #return unless html_path.exist? # what?
      raise unless html_path.exist? # what?
      file = base+'.html'
      str = html_path.read
      add_entry(zos, file, str)

      # Generate presen files.
      html_path = site_cache_path+"#{page.key}-presen.html"
      wabisabi = action.c_page_res(page.key)
      w = PresenGenerator.generate(site, page.key, wabisabi)
      str = w.format_xml
      file = "#{base}-presen.html"
      return add_entry(zos, file, str)
    end

    def self.add_txt(zos, base, page)
      file = "#{base}.txt"
      str = page.load
      return add_entry(zos, file, str)
    end

    def self.add_entry(zos, filename, content)
      e = Zip::ZipEntry.new('', filename)
      zos.put_next_entry(e)
      zos.write(content)
    end

    def self.add_theme(config, site, action, zos)
      ar = []

      # FIXME: collect file list from the directory.
      ar << 'css/base.css'
      ar << 'css/wema.css'
      ar << 'js/base.js'
      ar << 'js/debugwindow.js'
      ar << 'js/niftypp.js'
      ar << 'js/wema.js'
      ar << 'i/external.png'
      ar << 'i/new.png'

      t = action.site_theme
      list = action.theme_files(t)
      list.each {|f|
	ar << "#{t}/#{f}"
      }

      ar << 's5/i18n/slides.css'
      ar << 's5/i18n/s5-core.css'
      ar << 's5/i18n/framing.css'
      ar << 's5/i18n/pretty.css'
      ar << 's5/i18n/bg-shade.png'
      ar << 's5/i18n/bg-slide.jpg'

      ar << 's5/default/outline.css'
      ar << 's5/default/print.css'
      ar << 's5/default/opera.css'
      ar << 's5/default/slides.js'

      theme_dir = config.theme_dir
      ar.each {|b|
	file  = "#{site.sitename}/.theme/#{b}"
	local = "#{theme_dir}/#{b}"
	str = local.path.read
	add_entry(zos, file, str)
      }
    end
  end
end

if $0 == __FILE__
  require 'qwik/test-common'
  require 'qwik/util-pathname'
  $test = true
end

if defined?($test) && $test
  class TestActArchive < Test::Unit::TestCase
    include TestSession

    def test_plg_zip
      ok_wi([:p, [:a, {:href=>'test.zip'}, 'test.zip']], '[[test.zip]]')
      ok_wi([:span, {:class=>'attribute'},
	      [:a, {:href=>'test.zip'}, 'site archive']], '{{zip}}')
    end
  end

  class TestActArchive < Test::Unit::TestCase
    include TestSession

    def ok_nx(zis, f)
      e = zis.get_next_entry
      ok_eq_or_match(f, e.name)
    end

    def test_act_zip
      t_add_user

      page = @site['_SiteConfig']
      page.store(':theme:qwikborder')

      page = @site.create_new
      page.store('* あ')

      res = session('/test/test.zip')
      ok_eq('application/zip', res['Content-Type'])
      str = res.body
      assert_match(/\APK/, str)

      'testtemp.zip'.path.open('wb') {|f| f.print str }

      Zip::ZipInputStream.open('testtemp.zip') {|zis|
	ok_nx(zis, 'test/1.txt')
	ok_eq('* あ', zis.read)
	ok_nx(zis, 'test/1.html')
	ok_nx(zis, 'test/1-presen.html')

	ok_nx(zis, /\Atest\/_Site/)
	ok_nx(zis, /\Atest\/_Site/)
	ok_nx(zis, /\Atest\/_Site/)
	ok_nx(zis, /\Atest\/_Site/)
	ok_nx(zis, /\Atest\/_Site/)
	ok_nx(zis, /\Atest\/_Site/)

	ok_nx(zis, /\Atest\/.theme/)
	ok_nx(zis, /\Atest\/.theme/)
	ok_nx(zis, /\Atest\/.theme/)
	ok_nx(zis, /\Atest\/.theme/)
	ok_nx(zis, /\Atest\/.theme/)
	ok_nx(zis, /\Atest\/.theme/)
	ok_nx(zis, /\Atest\/.theme/)
	ok_nx(zis, /\Atest\/.theme/)
	ok_nx(zis, /\Atest\/.theme/)
	ok_nx(zis, /\Atest\/.theme/)
	ok_nx(zis, /\Atest\/.theme/)
	ok_nx(zis, /\Atest\/.theme/)
	ok_nx(zis, /\Atest\/.theme/)
	ok_nx(zis, /\Atest\/.theme/)
	ok_nx(zis, /\Atest\/.theme/)
	ok_nx(zis, /\Atest\/.theme/)
      }

      'testtemp.zip'.path.unlink
    end
  end

  class TestZipGenerator < Test::Unit::TestCase
    include TestSession

    def test_zip
      res = session

      page = @site.create_new
      page.store('* あ')

      zip = Qwik::ZipGenerator.generate(@config, @site, @action)
      assert_match(/test.zip\Z/, zip.to_s)
    end
  end

  class CheckZip < Test::Unit::TestCase
    def test_all
      return if $0 != __FILE__		# Only for separated test.

      file = 'test.zip'
      Zip::ZipOutputStream.open(file) {|zos|
	zos.put_next_entry('test/test.txt')
	zos.print('test')

	e = Zip::ZipEntry.new(file, 'test2.txt')
	zos.put_next_entry(e)
	zos.print('test2')
      }

      zip = file.path.open {|f| f.read }
      assert_match(/\APK/, zip)
      assert_match(/test.txt/, zip)

      Zip::ZipInputStream.open(file) {|zis|
	e = zis.get_next_entry
	ok_eq('test/test.txt', e.name)
	ok_eq('test', zis.read)

	e = zis.get_next_entry
	ok_eq('test2.txt', e.name)
	ok_eq('test2', zis.read)

	e = zis.get_next_entry
	ok_eq(nil, e)
      }

      file.path.unlink
    end
  end
end
