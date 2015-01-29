set :application, 'edify'
set :repo_url, 'git@github.com:landrywj/edify-e.git'

set :chruby_ruby, 'ruby-2.2.0'

set :branch, 'master'
server 'edify.solutions', user: 'edify', roles: [:web, :app, :db], primary: true

set :app_server, :puma
set :domain, 'https://edify-e.com'
set :puma_threads,    [4, 16]
set :puma_workers,    0

 # Don't change these unless you know what you're doing
 set :pty,             true
 set :use_sudo,        false

set :user, 'edify'
#set :deploy_via,      :remote_cache
set :deploy_to,       "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "/home/#{fetch(:user)}/apps/#{fetch(:application)}/shared/log/puma_access.log"
set :puma_error_log,  "/home/#{fetch(:user)}/apps/#{fetch(:application)}/shared/log/puma_error.log"
#set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true  # Change to true if using ActiveRecord

# Default value for :linked_files is []
 set :linked_files, %w{config/database.yml config/secrets.yml}

# Default value for linked_dirs is []
 set :linked_dirs, %w{public/uploads log}


namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end

namespace :deploy do

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end
  
  desc "Make sure local git is in sync with remote."
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/master`
        puts "WARNING: HEAD is not the same as origin/master"
        puts "Run `git push` to sync changes."
        exit
      end
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'puma:restart'
    end
  end

  before :starting,     :check_revision
  after  :finishing,    :compile_assets
  after  :finishing,    :cleanup
  after  :finishing,    :restart
end
