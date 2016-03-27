# wakayamarb.orgの構成テスト
これは、[serversepec](http://serverspec.org/)でのサーバ構成のテスト

## ライブラリの準備
`bundle install`

## テストを実行できるユーザ・環境・条件
- このテストを実行するマシン上の秘密鍵で、当該サーバにSSHできること
- sudoer（serviceが稼働しているかなどをチェックするため）

## テスト実行

`rake spec:wakayamarb.org ASK_SSH_USERNAME=1 ASK_SUDO_PASSWORD=1`

または

`rake spec:wakayamarb.org SSH_USERNAME=xxxx SUDO_PASSWORD=xxxx`

など
