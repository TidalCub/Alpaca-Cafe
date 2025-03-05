# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MqttLog, type: :model do
  describe '#log' do
    let(:topic) { 'test' }
    let(:payload) { double('payload') }

    context 'when there is an order' do
      before do
        VCR.use_cassette('stripe_customer_create') do
          @user = create(:user, stripe_id: 'cus_RNzSxzNYWd2eZ4')
        end
      end

      let(:order) { create(:order, user: @user) }

      it 'creates a new log' do
        described_class.log(topic, payload, order)
        expect(MqttLog.count).to eq 1
      end
    end
  end
end
