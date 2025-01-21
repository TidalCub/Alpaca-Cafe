require "rails_helper"

RSpec.describe "HistoricEventsService" do
  describe "#generate" do
    before do
      create(:product)
      VCR.use_cassette('stripe_customer_create') do
        create(:user)
      end
    end

    it "generates the number of events specified" do
      count = 5
      service = HistoricEventsService.new(count)
      expect(service.generate.count).to eq(count)
    end
  end
end