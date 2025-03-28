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

  # describe '#create_stripe_user' do
  #   it 'creates a Stripe customer and sets the stripe_id' do
  #     user.run_callbacks(:create)
  #     expect(user.stripe_id).to eq('cus_123456789')
  #   end
  # end

  describe '#add_role' do
    let!(:role) { create(:role, uuid: 'admin') }

    context 'when the user does not already have the role' do
      it 'adds the role to the user' do
        expect { user.add_role(role.id) }.to change { user.roles.count }.by(1)
        expect(user.roles.pluck(:uuid)).to include('admin')
      end
    end

    context 'when the user already has the role' do
      before { user.add_role(role.id) }

      it 'does not add the role again' do
        expect { user.add_role(role.id) }.not_to(change { user.roles.count })
      end
    end
  end

  describe '#remove_role' do
    let!(:role) { create(:role, uuid: 'admin') }

    context 'when the user has the role' do
      before { user.add_role(role.id) }

      it 'removes the role from the user' do
        expect { user.remove_role(role.id) }.to change { user.roles.count }.by(-1)
        expect(user.roles.pluck(:uuid)).not_to include('admin')
      end
    end

    context 'when the user does not have the role' do
      it 'does not change the roles count' do
        expect { user.remove_role(role.id) }.not_to(change { user.roles.count })
      end
    end
  end
end
