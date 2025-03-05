# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MqttService, type: :service do
  describe '#send' do
    subject(:service) { described_class.new }
    let(:payload) { double('payload') }

    before do
      VCR.use_cassette('stripe_customer_create') do
        @user = create(:user, stripe_id: 'cus_RNzSxzNYWd2eZ4')
      end
      CLIENT = instance_double('client') # rubocop:disable Lint/ConstantDefinitionInBlock
      allow(CLIENT).to receive(:publish)
    end

    let(:order) { create(:order, user: @user) }

    it 'calls the client' do
      service.send('test', payload, order)
      expect(CLIENT).to have_received(:publish)
    end

    it 'logs the mqtt' do
      allow(MqttLog).to receive('log')
      service.send('test', payload, order)
      expect(MqttLog).to have_received('log').with('test', anything, order)
    end
  end
end
