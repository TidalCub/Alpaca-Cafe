# frozen_string_literal: true

# rake product:export
namespace :product do
  desc 'Export Products as json'
  task export: :environment do
    puts 'Starting Export'
    ProductExportService.new.export
    puts 'Export generates successfully'
  end
end
