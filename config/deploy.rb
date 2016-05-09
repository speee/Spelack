# config valid only for current version of Capistrano
lock '3.5.0'

set :application, 'Spelack'
set :repo_url, 'git@github.com:MKenta/Spelack.git'
set :branch, 'deploy_test'
set :deploy_to, '/var/www/Spelack'
set :log_level, :debug

set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/assets}
set :rbenv_ruby, '2.2.3'

namespace :deploy do
  desc 'Create database'
  task :db_create do
    on roles(:db) do |host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:create'
        end
      end
    end
  end
  desc 'Run seed'
  task :seed do
    on roles(:app) do
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:seed'
        end
      end
    end
  end
  after :publishing, :restart
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
  namespace :setup do
   task :fix_premissions do
     "find . -type f -print | xargs chmod 644 #{deploy_to}"
     "find . -type d -print | xargs chmod 755 #{deploy_to}"
   end
  end
end
after 'deploy:publishing', 'deploy:restart'
