require 'spec_helper'

rails_username = 'railswrb'
ruby_version = '2.3.0'


# ユーザ #{rails_username}が存在する
describe user(rails_username) do
  it { should exist }
end


# 必要なaptパッケージがインストールされている
apt_packages = %w{
  ufw
  apache2
  postgresql-server
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
  postgresql-server
}
services.each do |svc|
  describe service(svc) do
    it { should be_enabled }
    it { should be_running }
  end
end


# #{rails_username}ユーザがrbenvがインストールされている
describe file("/home/#{rails_username}/.rbenv") do
  it { should be_directory }
end


# #{rails_username}ユーザがrbenvでruby#{ruby_version}がインストールされている
describe file("/home/#{rails_username}/.rbenv/versions/#{ruby_version}") do
  it { should be_directory }
end


# SSHポートが22以外のものに変更されている
describe port(22) do
  it { should_not be_listening }
end


# http用のポートがlistenされている
describe port(80) do
  it { should be_listening }
end


# パスワードでのSSHログインが禁止されている
describe file('/etc/ssh/ssh_config') do
  its(:content) { should_not match /^PasswordAuthentication yes$/ }
end


# rootユーザへのSSHログインが禁止されている
describe file('/etc/ssh/sshd_config') do
  its(:content) { should_not match /^PermitRootLogin yes$/ }
end
