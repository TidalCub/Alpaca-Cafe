require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:user) { create(:user) }
  let(:order) { create(:order, user:, state: 'pending') }

  describe 'state transitions' do
    context 'when transitioning from pending to paid' do
      it 'transitions to paid state' do
        expect(order.may_pay?).to be true
        order.pay!
        expect(order.state).to eq('paid')
      end
    end

    context 'when transitioning from paid to completed' do
      before do
        order.pay!
      end

      it 'transitions to completed state' do
        expect(order.may_complete?).to be true
        order.complete!
        expect(order.state).to eq('completed')
      end
    end
  end
end
