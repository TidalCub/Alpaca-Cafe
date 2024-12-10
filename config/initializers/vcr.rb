VCR.configure do |vcr_config|
  vcr_config.cassette_library_dir = 'fixtures/vcr_cassettes'
  vcr_config.hook_into :webmock
end
