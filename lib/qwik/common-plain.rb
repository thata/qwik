#
# Copyright (C) 2003-2006 Kouichirou Eto
#     All rights reserved.
#     This is free software with ABSOLUTELY NO WARRANTY.
#
# You can redistribute it and/or modify it under the terms of 
# the GNU General Public License version 2.
#

$LOAD_PATH << '..' unless $LOAD_PATH.include? '..'

module Qwik
  class Action
    # For page design check.
    def act_test_plain
      w = c_page_res('TextFormat')
      c_plain('act_test_plain') { w }
    end

    def c_plain(title, status=200, &b)
      msg = yield
      generate_plain_page(status, title, msg)
    end

    def generate_plain_page(status, title, msg)
      c_set_status(status)
      c_set_html
      c_set_no_cache
      template = @memory.template.get('plain')
      body = Action.plain_generate(template, title, msg)
      c_set_body(body)
      nil
    end

    def self.plain_generate(template, title, msg)
      w = template.get_tag('head')

      # insert title
      w.insert(1, [:title, title])

      # insert JavaScript
      js = generate_js
      w.insert(w.length, *js)

      # insert meta
      w << [:meta, {:name=>'ROBOTS', :content=>'NOINDEX,NOFOLLOW'}]

      # insert h1
      w = template.get_tag('h1')
      w << title

      # insert main
      w = template.get_by_class('main')
      w << msg

      template
    end

    JAVASCRIPT_FILES = %w(prototype scriptaculous base niftypp debugwindow)
    def self.generate_js
      return JAVASCRIPT_FILES.map {|f|
	generate_script("js/#{f}")
      }
    end

    def self.generate_script(f)
      return [:script, {:type=>'text/javascript', :src=>".theme/#{f}.js"}, '']
    end
  end
end

if $0 == __FILE__
  require 'qwik/test-common'
  $test = true
end

if defined?($test) && $test
  class TestActPlain < Test::Unit::TestCase
    include TestSession

    def test_test_plain
      t_add_user
      res = session('/test/.test_plain')
      ok_xp([:title, 'act_test_plain'], 'title', res)
    end

    def test_all
      res = session

      @action.generate_plain_page(200, 'title', 'msg')
      ok_eq(200, res.status)
      ok_xp([:title, 'title'], 'title', res)

      @action.c_plain('c_plain title'){'msg'}
      ok_eq(200, res.status)
      ok_xp([:title, 'c_plain title'], 'title', res)
    end

    def test_plain_generate
      res = session

      # test_original_template
      template = @memory.template.get('plain')
      ok_eq([:h1], template.get_tag('h1'))
      ok_eq([:div, {:class=>'main'}],
	    template.get_by_class('main'))

      # test_plain_generate
      res = Qwik::Action.plain_generate(template, 'title', 'msg')
      ok_eq([:title, 'title'], res.get_tag('title'))
#      ok_eq([:script, {:src=>'.theme/js/base.js',
#		:type=>'text/javascript'}, ''], res.get_tag('script'))
      ok_eq([:meta, {:content=>'NOINDEX,NOFOLLOW', :name=>'ROBOTS'}],
	    res.get_tag('meta'))
      ok_eq([:h1, 'title'], res.get_tag('h1'))
      ok_eq([:div, {:class=>'main'}, 'msg'],
	    res.get_path("//div[@class='main']"))
      ok_eq(nil, res.get_tag('meta[2]')) # not redirected
    end

    def test_generate_js
      c = Qwik::Action
      eq([:script, {:src=>'.theme/t.js', :type=>'text/javascript'}, ''],
	 c.generate_script('t'))
#      eq([[:script, {:src=>'.theme/js/base.js', :type=>'text/javascript'}, ''],
#	   [:script, {:src=>'.theme/js/niftypp.js', :type=>'text/javascript'},
#	     ''],
#	   [:script, {:src=>'.theme/js/debugwindow.js',
#	       :type=>'text/javascript'}, '']],
#	 c.generate_js)
    end
  end
end
