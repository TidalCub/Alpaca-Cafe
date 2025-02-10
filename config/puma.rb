app_dir = File.expand_path("../..", __FILE__)
shared_dir = "#{app_dir}/shared"

threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count

workers ENV.fetch("WEB_CONCURRENCY") { 2 }

bind "unix://#{shared_dir}/tmp/sockets/puma.sock"  # Make sure this matches your Nginx config

stdout_redirect "#{shared_dir}/log/puma.stdout.log", "#{shared_dir}/log/puma.stderr.log", true

pidfile "#{shared_dir}/tmp/pids/puma.pid"

daemonize true  # Ensures Puma runs in the background

preload_app!

plugin :tmp_restart
