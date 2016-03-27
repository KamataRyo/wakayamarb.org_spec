require 'spec_helper'

rails_user = 'railswrb'
ruby_version = '2.3.0'


# ユーザ #{rails_user}が存在する
describe user(rails_user) do
  it { should exist }
end


# 必要なaptパッケージがインストールされている
apt_packages = %w{
  ufw
  apache2
}
apt_packages.each do |pkg|
  describe package(pkg) do
    it { should be_installed.by('apt') }
  end
end


# 必要なサービスのが有効化されている
services = %w{
  ufw
  apache2
}
services.each do |svc|
  describe service(svc) do
    it { should be_enabled }
    it { should be_running }
  end
end


# #{rails_user}ユーザに対してrbenvがインストールされている
describe file("/home/#{rails_user}/.rbenv") do
  it { should be_directory }
end


# #{rails_user}ユーザに対してrbenvでruby#{ruby_version}がインストールされている
describe file("/home/#{rails_user}/.rbenv/versions/#{ruby_version}") do
  it { should be_directory }
end


# SSHポートが22以外のものに変更されている
describe file('/etc/ssh/ssh_config') do
  its(:content) { should match /^Port/ }
  its(:content) { should_not match /^Port 22$/ }
end


# パスワードでのSSHログインが禁止されている
describe file('/etc/ssh/ssh_config') do
  its(:content) { should_not match /^PasswordAuthentication yes$/ }
end
