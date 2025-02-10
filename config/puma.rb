# Set the directory
app_dir = File.expand_path("../..", __FILE__)
shared_dir = "#{app_dir}/shared"

# Number of threads per worker
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count

# Workers (adjust based on CPU cores)
workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# Set up socket location
bind "unix://#{shared_dir}/sockets/puma.sock"

# Logging
stdout_redirect "#{shared_dir}/log/puma.stdout.log", "#{shared_dir}/log/puma.stderr.log", true

# Set up PID file
pidfile "#{shared_dir}/pids/puma.pid"

# Run in daemon mode
daemonize true

# Preload the app before forking workers
preload_app!

# Restart workers if they hang
worker_timeout 30

# Allow Puma to be restarted by `rails restart`
plugin :tmp_restart
