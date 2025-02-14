# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  before do
    allow(Stripe::Customer).to receive(:create).and_return(double(id: 'cus_123456789'))
  end

  describe '#basket' do
    context 'when there is a pending or on_checkout order' do
      let!(:pending_order) { create(:order, user: user, state: 'pending') }

      it 'returns the pending or on_checkout order' do
        expect(user.basket).to eq(pending_order)
      end
    end

    context 'when there is no pending or on_checkout order' do
      let!(:store) { create(:store) }

      it 'creates and returns a new pending order' do
        user.basket.update(store_id: store.id)
        expect(user.basket).to be_persisted
        expect(user.basket.state).to eq('pending')
      end
    end
  end

  describe '#create_stripe_user' do
    it 'creates a Stripe customer and sets the stripe_id' do
      user.run_callbacks(:create)
      expect(user.stripe_id).to eq('cus_123456789')
    end
  end
end
