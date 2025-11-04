# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.3'

gem 'prometheus_exporter'

gem 'aasm', '~> 5.5'
gem 'action_policy'
gem 'activesupport', '~> 8.0'
gem 'bootsnap', require: false
gem 'bootstrap', '~> 5.0'
gem 'bootstrap-email'
gem 'devise', '~> 4.9'
gem 'factory_bot_rails', '>= 6.5.0'
gem 'faker'
gem 'googleauth'
gem 'google-cloud-retail'
gem 'importmap-rails', '>= 2.2.0'
gem 'jbuilder'
gem 'jquery-rails'
gem 'kamal', '>= 2.5.0', require: false
gem 'lazyload-rails'
gem 'mqtt'
gem 'pg', '~> 1.5', '>= 1.5.4', group: :production
gem 'puma', '~> 6.0'
gem 'rails', '~> 8.0', '>= 8.0.2.1'
gem 'redis', '~> 4.0'
gem 'sassc-rails'
gem 'stackprof'
gem 'sentry-rails', '>= 5.23.0'
gem 'sentry-ruby'
gem 'slim-rails'
gem 'sprockets-rails'
gem 'sqlite3'
gem 'stackprof'
gem 'stimulus-rails'
gem 'stripe'
gem 'turbo-rails', '>= 2.0.12'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]

  gem 'rails-controller-testing'
  gem 'rspec-rails', '>= 7.1.1'
  gem 'rubocop-rails', '>= 2.30.0', require: false
end

group :development do
  gem 'brakeman', require: false
  gem 'capistrano', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-rbenv', require: false # Or `capistrano-rvm` if you use RVM
  gem 'rack-mini-profiler', '>= 4.0.0'
  gem 'web-console'
end

group :test do
  gem 'database_cleaner'
  gem 'selenium-webdriver', '>= 4.29.0'
  gem 'simplecov', require: false
  gem 'vcr'
  gem 'webmock', '>= 3.25.0'
end

gem 'opentelemetry-instrumentation-all', '~> 0.74.0'
gem 'opentelemetry-sdk', '~> 1.8'
