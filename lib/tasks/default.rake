# frozen_string_literal: true

namespace :default do
  desc 'Run RSpec, RuboCop, and Brakeman'
  task run_all: %i[rspec rubocop brakeman]

  desc 'Run RSpec tests'
  task rspec: :environment do
    puts 'Running RSpec...'
    sh 'bundle exec rspec'
  end

  desc 'Run RuboCop'
  task rubocop: :environment do
    puts 'Running RuboCop...'
    sh 'bundle exec rubocop'
  end

  desc 'Run Brakeman'
  task brakeman: :environment do
    puts 'Running Brakeman...'
    sh 'bundle exec brakeman'
  end
end

# Set the default task to run all
task default: 'default:run_all'
