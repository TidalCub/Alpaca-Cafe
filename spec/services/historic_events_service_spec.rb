# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'HistoricEventsService' do
  describe '#generate' do
    before do
      create(:product)
      VCR.use_cassette('stripe_customer_create') do
        create(:user)
      end
    end
  end
end
