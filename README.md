# wakayamarb.orgの構成テスト
これは、[serversepec](http://serverspec.org/)でのサーバ構成のテスト

## テストを実行できるユーザ・環境・条件
- このテストを実行するマシン上の秘密鍵で、当該サーバにSSHできること
- sudoers(serviceが稼働しているかなどをチェックするため)

## 準備
```
git clone git@github.com:KamataRyo/wakayamarb.org_spec.git
cd wakayamarb.org_spec
bundle install
```

## テスト実行
```
rake spec:wakayamarb.org ASK_SSH_USERNAME=1 ASK_SUDO_PASSWORD=1
```
または
```
rake spec:wakayamarb.org SSH_USERNAME=xxxx SUDO_PASSWORD=xxxx
```
など
