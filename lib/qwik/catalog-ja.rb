#
# Copyright (C) 2003-2006 Kouichirou Eto
#     All rights reserved.
#     This is free software with ABSOLUTELY NO WARRANTY.
#
# You can redistribute it and/or modify it under the terms of 
# the GNU General Public License version 2.
#

module Qwik; end

class Qwik::CatalogFactory
  def self.catalog_ja
    {
      # for test
      'hello' => 'こんにちは',

      # Error
      'Error' => 'エラー',
      'Failed' => '失敗',
      'No message' => 'メッセージがありません',
      'No text' => 'テキストがありません',

      # action.rb
      'No such site' => '対応するサイトがありません',
      'no correspond site' => '対応するサイトはありません',
      'Please send mail to make a site' =>
      'qwikWebのサイトを作るには、まずメールを送る必要があります。',
      'Login' => 'ログイン',
      'Access here and see how to.' => 'にアクセスして、使い方をご覧下さい。',
      'Please login.' => 'ログインしてください',
      'Member Only' => 'メンバー専用',
      'You are now logged in as this user id.' =>
      'あなたは今このユーザIDでログインしています',
      'You are now logged in yet.' =>
      'あなたはまだログインしていません',
      'If you would like to login as another account,' =>
      '別のユーザIDでログインしなおしたい場合は、',
      'do logout at the first.' => 'まずログアウトしてください',
      ': access here, and login again.' =>
      'してから再度アクセスしてください。',
      'You need login to use this function.' =>
      'この機能を利用するにはログインする必要があります。',
      'Go back' => '戻る',
      'Need POST' => 'POST入力が必要',
      'This function needs POST method.' =>
      'この操作はPOST入力で行う必要があります。',
      'Page not found.' => 'ページが見つかりません',
      "Push create if you'd like to create the page." =>
      'ページを作成したい場合は、新規作成を押してください',

      'Require no path args' => '変なパスがついてます',
      'Path argments are not acceptable.' =>
      'なにか変なパスがついちゃってます。',

      'Not found.' => 'ありません',
      'Access here.' => 'こちらをご覧ください。',

      # act-album
      'Show album in fullscreen.' => 'アルバムをフルスクリーンで見る',

      # act-archive
      'site archive' => 'サイトアーカイブ',

      # act-attach
      'Files' => '添付ファイル',
      'del' => '消去',
      'download' => 'ダウンロード',
      'No such file' => 'ファイルが見つかりません',
      'There is a file with same file name.' =>
      '同名のファイルが存在しています',
      'Can not use Japanese character for file name' =>
      '日本語のファイル名は使えません',
      'The file is saved.' => 'ファイルをセーブしました。',
      'Attach file done' => 'ファイルを添付しました',
      'Attach file' => 'ファイル添付',
      'Attach a file' => 'ファイルを添付します',
      'Confirm to delete a file' => 'ファイル消去確認画面',
      "Push 'Delete' to delete a file" =>
      '「消去する」を押すと，本当にファイルを消去します．',
      'Delete' => '消去する',
      'Already deleted.' => 'すでに消去されているようです',
      'Failed to delete.' => 'ファイル消去に失敗しました。謎。',
      'The file is deleted.' => '消去しました',
      'File list' => '現在添付されているファイル',
      # other
      '->' => '→',
      'attach' => '添付する',

      # act-backup
      'The first page.' => 'これは最初のページです。',
      'Diff from the previous page' => '前回からの差分',
      'Original data' => '元データ',
      '<-' => '←',
      'newest' => '最新',
      'backup list' => 'バックアップ一覧',

      # act-basic-plugin
      'newpage' => '新規作成',
      'edit' => '編集',
      'wysiwyg' => 'その場で編集',
      'Last modified' => '最終更新',
      'Generate time' => '生成時間',
      'sec.' => '秒',
      'SiteMenu' => 'サイトメニュー',
      'SiteConfig' => 'サイト設定',
      'TimeLine' => '年表 ',
      'Group members' => 'グループメンバー',

      'Functions' => '機能の説明',
      'Page List' => 'ページ一覧',
      'Recent Changes' => '更新履歴',
      ' ago' => '前',
      'more...' => 'もっと前の情報',
      'min.' => '分',
      'hour' => '時間',
      'day' => '日',
      'month' => 'ヶ月',
      'year' => '年',
      'century' => '世紀',

      # act-comment
      'User' => 'ユーザ名',
      'Message' => 'メッセージ',
      'Message is added.' => 'メッセージを追加しました',

      # act-day
      'A day' => '一日',

      # act-describe
      'Function' => '機能説明',
      'Functions list' => '機能一覧',

      # act-edit.rb
      'Page is deleted.' => 'ページを削除しました',
      'Password does not match.' => 'パスワードが一致しませんでした。',
      'Password' => 'パスワード',
      'Please find a line like above, then input password in parentheses.' =>
      'このような行を探して、括弧の中にパスワードを入力してください。',

      'Page edit conflict' => '更新が衝突しました。',
      'Please save the following content to your text editor.' =>
      '下記の内容をテキストエディタなどに保存し、',
      'Newest page' => '最新のページ',
      ': see this page and re-edit again.' => 'を参照後に再編集してください。',
      'Page is saved.' => 'ページを保存しました。',

      'Save' => '保存',
      'Attach' => '添付',

      'Edit' => '編集',
      'Attach Files' => 'ファイル添付',
      'Attach many files' => 'もっとたくさん添付する',

      'Help' => 'ヘルプ',
      'How to qwikWeb' => 'qwikWebの使い方',

      'Site admin' => 'サイト管理',

      'Header' => '見出し',
      'List' => '箇条書 ',
      'Ordered list' => '順序リスト ',
      'Blockquote' => '引用 ',
      'Word' => '定義',
      'Definition' => '言葉の定義 ',
      'Table' => '表 ',
      'Emphasis' => '強調',
      'Strong' => 'もっと強調',
      'Link' => 'リンク',
      'more help' => 'もっと詳しい書式',

      'Text Format' => '書式一覧',
      'History' => '履歴',
      'Backup' => 'バックアップ',
      'Time machine' => 'タイムマシーン',
#      'Experimental functions' => '実験中の機能 ',
      'Page functions' => 'ページの機能 ',

      # act-getpass
      'Invalid mail address' => 'パスワード形式エラー',
      'Get Password' => 'パスワード入手',
      'Send Password' => 'パスワード送信',
      'You will get the password by e-mail.' => 'パスワードをメールで送ります',
      'Please input your mail address.' => 'メールアドレスを入力してください',
      'Mail address' => 'メールアドレス',
      'Go back to Login' => 'ログイン画面にもどる',

      'Send' => '送信',

      'You input this e-mail address as user id.' =>
      'あなたはユーザIDとしてこのメールアドレスを入力しました',
      'This user id is not a member of this group.' =>
      'このユーザIDは、このグループには含まれていません',
      'Only the member of this group can get password.' =>
      'このグループのメンバーは、パスワードを取得できます。',

      'Your password on' => 'パスワード :',
      'This is your user name and the password on ' =>
      'このサイトにおけるユーザ名とパスワードです : ',
      'Username' => 'ユーザ名',
      'Password' => 'パスワード',
      'Please access login page on' =>
      'ログインページにアクセスしてください :',
      'You can input user and pass from this URL automatically.' =>
      '下記URLにアクセスすると、自動的にユーザー名とパスワードを入力します。',

      'The mail address format is wrong.' =>
      'メールアドレスの形式が間違ってます。',
      'Please confirm the input again.' => 'もう一度入力を確認してください。',
      'Please access again.' => '再度アクセスしてください。',
      'Send Password Error' => 'メール送信エラー',
      'Send failed for system error.' =>
      'システムエラーのため、パスワード送信に失敗しました。',
      'Please contact administrator.' => 'システム管理者にご連絡下さい。',

      'Send Password done' => 'パスワード送信完了',
      'I send the password to this mail address.' =>
      'パスワードを以下のメールアドレスに送信しました。',
      'Please check your mailbox.' => 'メールボックスを確認してください',

      # act-group
      'Member list' => 'メンバー一覧',

      # act-hcomment
      'Name' => 'お名前',
      'Comment' => 'コメント',
      'Anonymous' => '名無しさん',
      'Add a comment.' => 'コメントを追加しました',
      'Submit' => '投稿',
      'Page collision is detected.' => '更新が衝突しました',
      'Go back and input again.' => '元のページに戻り、再度入力してください。',

      # act-history
      'Time machine' => 'タイムマシーン',
      'Move this' => 'これを動かして下さい',

      # act-license
      'You can use the files on this site under [[Creative Commons by 2.1|http://creativecommons.org/licenses/by/2.1/jp/]] license.' =>
      'ここに置かれたファイルは、[[クリエイティブ・コモンズ帰属 2.1|http://creativecommons.org/licenses/by/2.1/jp/]]ライセンスの下に利用できます。',
      'You can use the files on this site under [[Creative Commons Attribution-ShareAlike 2.5|http://creativecommons.org/licenses/by-sa/2.5/]] license.' =>
      'ここに置かれたファイルは、[[クリエイティブ・コモンズ 帰属 - 同一条件許諾 2.5|http://creativecommons.org/licenses/by-sa/2.5/]]ライセンスの下に利用できます。',
      'The files you uploaded will be under [[Creative Commons Attribution-ShareAlike 2.5|http://creativecommons.org/licenses/by-sa/2.5/]] license.' =>
      'ここにアップロードされたファイルは、[[クリエイティブ・コモンズ 帰属 - 同一条件許諾 2.5|http://creativecommons.org/licenses/by-sa/2.5/]]ライセンスの下に置かれます。',

      # act-login
      'Logout' => 'ログアウト',
      'Login by Session' => 'Sessionによるログイン',
      'succeed' => '成功',
      'Go next' => '次へ',
      'Session ID Auth' => 'Session ID認証',
      'or, Access here.' => 'または、こちらをご利用下さい。',
      'Login by using Basic Auth.' => 'Basic認証でログインしました。',
      'Login by Basic Auth' => 'Basic認証でログイン',
      'Do login by Basic Auth.' => 'Basic認証でログインします。',
      'Login by cookie' => 'cookieによるログイン',
      'You are already login by cookie.' => '現在cookieでログインしています。',

      'Login Error' => 'ログインエラー',
      'Invalid ID(E-mail) or Password.' =>
      'ユーザID(E-mail)もしくはパスワードが違います',

      'Already logged in' => 'ログイン済み',

      'Please confirm the mail again.' =>
      '入力に間違いがないかどうかもう一度メールをご確認ください。',
      '(Please do not use copy & paste.  Please input the password from keryboard again.)' => '(コピー&ペーストだとエラーになる場合があります。その場合はお手数ですがキーボードから入力してみてください)',
      'Can not logout.' => 'ログアウトできません',
      'You can not logout in Basic Auth mode.' =>
      'Basic認証の場合はログアウトできません。',
      'Please close browser and access again.' =>
      '一旦ブラウザを閉じて、再度アクセスしてください。',
      'Terminal Number is deleted.' => '端末番号を削除しました',
      'Basic Auth' => 'Basic認証',
      'For mobile phone user' => '携帯電話の方はこちらへ',
      'Logout done.' => 'ログアウト完了',
      'Confirm' => '確認',
      "Push \"Do Logout\"." =>
      '「ログアウトする」を押すと、本当にログアウトします。',
      'Do Logout' => 'ログアウトする',

      'Login to ' => 'ログインします : ',
      'Please input ID(E-mail) and password.' =>
      'ユーザIDとパスワードを入力してください',
      'ID' => 'ユーザID',
      'Password' => 'パスワード',

      "If you don't have password, " => 'パスワードをお持ちでない方は',
      'access here' => 'こちらをご覧下さい',
      "If you don't have password" => 'パスワードをまだ持ってない?',
      'For mobile phone user, please use' =>
      '携帯電話の方は、こちらをご利用下さい',
      'You can also use TypeKey' => 'TypeKeyも使えます',
      'Login by TypeKey' => 'TypeKeyでログイン',

      # act-member
      'Add a member' => 'メンバー追加',
      'Mail address to add' => '追加するメールアドレス',
      'Add' => '追加',
      'Invalid Mail' => '無効なメールアドレス',
      'Already exist' => 'すでに存在してます',
      'Member added' => 'メンバーは追加されました',
      'Member list' => 'メンバー一覧',
      'Member' => 'メンバー',

      # act-mlsubmitform
      'Mlcommit' => '投稿する。',

      # act-plan
      'Plan' => '予定',

      # act-schedule
      'Schedule' => 'スケジュール',
      'Date' => '日付',
      'Schedule edit done.' => 'スケジュールを入力しました。',

      # act-slogin
      'Session ID is registerd.' => 'Session IDを登録しました。',

      # act-style
      'Access Failed' => 'アクセスできませんでした',

      # act-map
      'Show map in fullscreen.' => '地図をフルスクリーンで見る',

      # act-mcomment
      'Failed' => '失敗しました',

      # act-mdlb
      'Please specify file.' => 'ファイルを指定してください。',
      'Please contact the administrator.' => '管理者に連絡してください。',
      'The file is saved as this filename.' =>
      'このファイル名でセーブされました。',
      'The image is also saved.' =>
      '画像ファイルもセーブされました。',
      'Model file' => 'モデルファイル',
      'Image file' => '画像ファイル',

      # act-mdblb-model
#      'Title' => 'タイトル',
      'Author' => '作者',
#      'Comment' => 'コメント',
      'Download' => 'ダウンロード',

      # act-new
      'Push create.' => '新規作成を押してください。',
      'New page' => '新規作成',
      'Title' => 'タイトル',
      'PageKey' => 'ページキー',
      'Already exist' => 'すでに存在しています',
      ' is already exist.' => 'はすでに存在しています。',
      'Please specify another title.' => '違うタイトルを指定してください。',
      'Created.' => '作成しました',
      'Edit new page' => '新規ページを編集',

      # etc.
      'Show history' => '過去の変遷を辿る',
      'Show backup' => 'いままでの履歴',

      # act-presen
      'Presentation mode' => 'プレゼンモード',
      # other
      'Presen' => 'プレゼン',
      'presentation' => 'プレゼンテーション',

      # act-search
      'Search' => '検索',
      'Search result' => '検索結果',
      'No match.' => '見つかりませんでした。',

      # act-table-edit
      'You can only use a table.' => 'tableしか使えません。',
      'You can only use text.' => 'textしか使えません。',
      'Update' => '更新',
      'Edit done.' => '編集完了',

      # act-textarea
      'Edit text done.' => 'テキストを編集しました',

      # act-takahashi
      'Show in fullscreen.' => 'フルスクリーンで見る',

      # act-time-walker
      'Time walker' => '時間旅行',
      'Chronology' => ' 年表 ',

      # act-toc
      'contents' => '目次',

      # act-typekey
      'Can not use.' => '使えません。',
      'Verify failed.' => '認証できませんでした。',
      'Time out.' => '時間切れです。',

      # act-wysiwyg
      'Edit in this page' => 'その場で編集',
      'Auto save' => '自動保存',
      'This is experimental function.' => 'この機能はまだ実験中です。',
      'The contents will be translated to html.' =>
      'ページの内容は、全てHTMLに変換されます。',
      'Please use this function only if you understand what will happen.' =>
      '何が起るのかを理解されている場合のみ、お使い下さい。',

      # act-wema
      'New post-it is created.' => '付箋を新規に作成しました',
      'Edit done.' => '編集しました',
      'No action.' => '何もしませんでした',
      'Delete a Post-it.' => '付箋を消去しました',
      'Set position.' => '位置をセットしました',
      'Post-it' => '附箋',
      'New Post-it' => '新規附箋',
      'help' => '使い方',
      'Draw Line' => '線を引く',
      'Text color' => '文字色',
      'Background' => '背景色',

      # Add you catalog here.
      '' => '',
      '' => '',
      '' => '',
      '' => '',
      '' => '',
      '' => '',
      '' => '',
      '' => '',
    }
  end
end
