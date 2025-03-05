# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.3'

gem 'rails', '~> 8.0'
gem 'simplecov', require: false, group: :test
gem 'sprockets-rails'
gem 'sqlite3'
gem 'activesupport', '~> 8.0'
gem 'puma', '~> 6.0'
gem 'importmap-rails'
gem 'turbo-rails'
gem 'stimulus-rails'
gem 'jbuilder'
gem 'redis', '~> 4.0'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem "stackprof"
gem "sentry-ruby"
gem "sentry-rails"

gem 'bootsnap', require: false
gem 'sassc-rails'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]

  gem 'rails-controller-testing'
  gem 'rspec-rails', '>= 3.9.0'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
  gem 'capistrano', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-rbenv', require: false # Or `capistrano-rvm` if you use RVM
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'database_cleaner'
  gem 'selenium-webdriver'
end

gem 'aasm', '~> 5.5'
gem 'action_policy'
gem 'bootstrap', '~> 5.0'
gem 'bootstrap-email'
gem 'devise', '~> 4.9'
gem 'factory_bot_rails'
gem 'faker'
gem 'googleauth'
gem 'google-cloud-retail'
gem 'jquery-rails'
gem 'kamal', require: false
gem 'lazyload-rails'
gem 'mqtt'
gem 'pg', '~> 1.5', '>= 1.5.4', group: :production
gem 'rubocop-rails', require: false
gem 'slim-rails'
gem 'stripe'
gem 'vcr'
gem 'webmock'
