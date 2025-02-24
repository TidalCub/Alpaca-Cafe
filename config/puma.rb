# Specifies the `environment` that Puma will run in.
environment ENV.fetch("RAILS_ENV") { "development" }

if ENV.fetch("RAILS_ENV") { "development" } == "production"
  # Production-specific configuration

  stdout_redirect "/var/www/Alpaca_Cafe/log/puma.stdout.log", "/var/www/Alpaca_Cafe/log/puma.stderr.log", true

  threads_count = ENV.fetch('RAILS_MAX_THREADS', 3)
  threads threads_count, threads_count

  bind "unix:/var/www/Alpaca_Cafe/shared/sockets/puma.sock"  # Make sure this matches your Nginx config

  # Specifies the `port` that Puma will listen on to receive requests; default is 3000.
  port ENV.fetch('PORT', 3000)

  # Allow puma to be restarted by `bin/rails restart` command.
  plugin :tmp_restart

  # Run the Solid Queue supervisor inside of Puma for single-server deployments
  plugin :solid_queue if ENV['SOLID_QUEUE_IN_PUMA']

  # Specify the PID file. Defaults to tmp/pids/server.pid in development.
  # In other environments, only set the PID file if requested.
  pidfile ENV['PIDFILE'] if ENV['PIDFILE']
else
  # Development-specific configuration

  threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
  threads threads_count, threads_count

  port        ENV.fetch("PORT") { 3000 }

  workers ENV.fetch("WEB_CONCURRENCY") { 2 }

  preload_app!

  on_worker_boot do
    ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
  end

  plugin :tmp_restart
end