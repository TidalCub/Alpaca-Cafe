namespace :events do
  desc 'Generate historic events'
  task generate: :environment do
    puts 'Generating events...'
    count = ENV['COUNT'] || '100'
    service = HistoricEventsService.new(count.to_i)
    service.generate
    puts 'Events generated successfully.'
  end
end
