# wakayamarb.org_spec
serversepecでのwakayamarb.orgのテスト

## プロビジョニング
`bundle install`

## テスト実行

`rake spec:wakayamarb.org ASK_SSH_USERNAME=1 ASK_SUDO_PASSWORD=1`

または

`rake spec:wakayamarb.org SSH_USERNAME=xxxx SUDO_PASSWORD=xxxx`

など
