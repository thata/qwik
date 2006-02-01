#
# Copyright (C) 2003-2006 Kouichirou Eto
#     All rights reserved.
#     This is free software with ABSOLUTELY NO WARRANTY.
#
# You can redistribute it and/or modify it under the terms of 
# the GNU General Public License version 2.
#

$LOAD_PATH << '..' unless $LOAD_PATH.include? '..'
require 'qwik/test-module-ml'

if $0 == __FILE__
  $test = true
end

class TestSubmitBase64 < Test::Unit::TestCase
  include TestModuleML

  def test_all
    group = QuickML::Group.new(@ml_config, 'test@example.com')
    group.setup_test_config

    str =
"Date: Thu, 14 Apr 2005 21:22:30 +0900
From: bob@example.net
To: test@example.com
User-Agent: Wanderlust/2.10.0 (Venus) SEMI/1.14.4 (Hosorogi) FLIM/1.14.4
 (=?ISO-8859-4?Q?Kashiharajing=FE-mae?=) APEL/10.4 Emacs/21.3
 (i386-pc-linux-gnu) MULE/5.0 (SAKAKI)
MIME-Version: 1.0 (generated by SEMI 1.14.4 - 'Hosorogi')
Content-Type: multipart/mixed;
 boundary=\"Multipart_Thu_Apr_14_21:22:30_2005-1\"
Subject: This is an inline test.

--Multipart_Thu_Apr_14_21:22:30_2005-1
Content-Type: text/plain; charset=ISO-2022-JP

サンプル.jpgを添付してみます。
--Multipart_Thu_Apr_14_21:22:30_2005-1
Content-Type: image/jpeg
Content-Disposition: inline; filename=\"sample.jpg\"
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAIAAACQd1PeAAAADElEQVR42mP4//8/AAX+Av4zEpUU
AAAAAElFTkSuQmCC

"
    mail = QuickML::Mail.generate { str }

    group.site_post(mail, true)
    page = @site['1']
    # $KCODE = 's'
    ok_eq('This is an inline test.', page.get_title)
    ok_eq("* This is an inline test.
{{mail(bob@example.net,0)
サンプル.jpgを添付してみます。

{{file(sample.jpg)}}
}}
", page.load)
    ok_eq(true, @site.files(page.key).exist?('sample.jpg'))
  end
end
