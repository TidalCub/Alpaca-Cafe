# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PrintReceiptService, type: :service do
  describe '#send' do
    subject(:service) { described_class.new(order) }

    before do
      VCR.use_cassette('stripe_customer_create') do
        @user = create(:user, stripe_id: 'cus_RNzSxzNYWd2eZ4')
      end
      CLIENT = instance_double('client') # rubocop:disable Lint/ConstantDefinitionInBlock
      allow(CLIENT).to receive(:publish)
    end

    let(:user) { @user }
    let(:order) { create(:order, user:, state: 'paid') }
    let(:product) { create(:product) }
    let!(:order_item) { create(:order_item, order:, product:) }

    it 'publishes the payload to the printer topic' do
      service.send

      expect(CLIENT).to have_received(:publish)
    end
  end
end
