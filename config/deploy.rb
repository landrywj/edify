# config valid only for current version of Capistrano
lock '3.5.0'

set :application, 'edify'

# Remote repo url
set :repo_url, 'git@github.com:landrywj/edify'

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/landrywj/apps/edify'

#Optional restart mechanism for Capistrano-Passenger
set :passenger_restart_with_touch, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
set :default_env, path: '/opt/ruby/bin:$PATH'

namespace :deploy do

  desc 'Create, migrate and seed the database'
  task :database_setup do
    on roles(:db) do
      execute 'rake db:setup'
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Do something here.
    end
  end
end
