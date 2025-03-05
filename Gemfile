# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.3'

gem 'aasm', '~> 5.5'
gem 'action_policy'
gem 'activesupport', '~> 8.0'
gem 'bootsnap', require: false
gem 'bootstrap', '~> 5.0'
gem 'bootstrap-email'
gem 'devise', '~> 4.9'
gem 'factory_bot_rails'
gem 'faker'
gem 'googleauth'
gem 'google-cloud-retail'
gem 'importmap-rails'
gem 'jbuilder'
gem 'jquery-rails'
gem 'kamal', require: false
gem 'lazyload-rails'
gem 'mqtt'
gem 'pg', '~> 1.5', '>= 1.5.4', group: :production
gem 'puma', '~> 6.0'
gem 'rails', '~> 8.0'
gem 'redis', '~> 4.0'
gem 'sassc-rails'
gem 'sentry-rails'
gem 'sentry-ruby'
gem 'slim-rails'
gem 'sprockets-rails'
gem 'sqlite3'
gem 'stackprof'
gem 'stimulus-rails'
gem 'stripe'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]

  gem 'rails-controller-testing'
  gem 'rspec-rails', '>= 3.9.0'
  gem 'rubocop-rails', require: false
end

group :development do
  gem 'capistrano', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-rbenv', require: false # Or `capistrano-rvm` if you use RVM
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'database_cleaner'
  gem 'selenium-webdriver'
  gem 'simplecov', require: false
  gem 'vcr'
  gem 'webmock'
end
