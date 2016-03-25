require 'serverspec'
require 'net/ssh'

if ENV['ASK_SSH_USERNAME'] || ENV['ASK_SUDO_PASSWORD']
  begin
    require 'highline/import'
  rescue LoadError
    fail "highline is not available. Try installing it."
  end
end

set :backend, :ssh
ssh_username = ''


if ENV['ASK_SSH_USERNAME']
  ssh_username = ask("Enter SSH username: ") { |q| q.echo = false }
else
  ssh_username = ENV['SSH_USERNAME'] || Etc.getlogin
end

if ENV['ASK_SUDO_PASSWORD']
  set :sudo_password, ask("Enter SSH user's sudo password: ") { |q| q.echo = false }
else
  set :sudo_password, ENV['SUDO_PASSWORD']
end

host = ENV['TARGET_HOST']
options = Net::SSH::Config.for(host)
options[:user] ||= ssh_username

set :host,        options[:host_name] || host
set :ssh_options, options

# Disable sudo
# set :disable_sudo, true


# Set environment variables
# set :env, :LANG => 'C', :LC_MESSAGES => 'C'

# Set PATH
# set :path, '/sbin:/usr/local/sbin:$PATH'
