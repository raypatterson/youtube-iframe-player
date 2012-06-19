#!/usr/bin/env ruby

require 'fileutils'
require 'heroku'

ROOT = File.expand_path "."
HEROKU_APP = "youtube-iframe-player"
ENV_DEV = "dev"
ENV_REVIEW = "review"
MASTER_BRANCH = "master"

LOCALHOST = "http://localhost:"
port_mm = 8888
 
# Build Tasks
desc "Build clean"
task :build do
  sh %{middleman build -c}
end
 
desc "Build Fast"
task :fast do
  sh %{middleman build}
end
 
desc "Server start"
task :mm, [:port] do |t, args| 
  port_mm = args.port || port_mm
  sh %{middleman server -p #{port_mm}}
end
 
# Heroku
desc "Heroku Create Apps"
task :heroku_create_apps do
  heroku_create_app ENV_DEV
  # heroku_create_app ENV_REVIEW
  sh %{git remote -v}
end

desc "Heroku Add Remotes"
task :heroku_add_remotes do
  heroku_add_remote ENV_DEV
  # heroku_add_remote ENV_REVIEW
  sh %{git remote -v}
end

desc "Heroku Deploy DEV"
task :heroku_deploy_dev, [:branch] do |t, args|
  heroku_deploy ENV_DEV, args.branch
end

desc "Heroku Deploy REVIEW"
task :heroku_deploy_review, [:branch] do |t, args|
  heroku_deploy ENV_REVIEW, args.branch
end

def heroku_create_app (env)
  app_name = "#{env}-#{HEROKU_APP}"
  # sh %{heroku apps:destroy --confirm #{app_name}}
  sh %{heroku apps:create -r #{env} -s cedar #{app_name}}
end

def heroku_add_remote (env)
  app_name = "#{env}-#{HEROKU_APP}"
  remote_url = "git@heroku.com:#{app_name}.git"
  # sh %{git remote rm #{env}}
  sh %{git remote add #{env} #{remote_url}}
end

desc "Heroku Deploy"
def heroku_deploy (env, branch)
  branch ||= MASTER_BRANCH
  sh %{git push #{env} #{branch}:master}
  # sh %{git push #{env} #{branch}:master}
end

# Utils
desc "Find Process on Port"
task :find_port, [:port] do |t, args|
  sh %{lsof -w -n -i tcp:#{args.port}}
end
 
# Open browsers
desc "Open Chrome"
task :chrome do
  sh %{open /Applications/Google\ Chrome.app #{LOCALHOST}#{port_mm}}
end
 
desc "Open FF"
task :ff do
  sh %{open -a Firefox #{LOCALHOST}#{port_mm}}
end
 
desc "Open Safari"
task :safari do
  sh %{open -a Safari #{LOCALHOST}#{port_mm}}
end