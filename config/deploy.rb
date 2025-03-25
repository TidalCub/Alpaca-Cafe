# config valid for current version and patch releases of Capistrano
lock "~> 3.19.2"

set :application, "Alpaca_Cafe"
set :repo_url, "https://github.com/TidalCub/Alpaca-Cafe"

set :deploy_to, "/var/www/#{fetch(:application)}"
set :branch, "main"
set :keep_releases, 5
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads', 'storage'
append :linked_files, 'config/master.key', 'db/production.sqlite3'

set :ssh_options, {
  forward_agent: true,
  auth_methods: %w(publickey),
  user: 'deploy'
}

namespace :deploy do
  desc 'Restart Puma'
  task :restart_puma do
    on roles(:app) do
      execute :sudo, "systemctl restart puma"
    end
  end
end

after "deploy:publishing", "deploy:restart_puma"
