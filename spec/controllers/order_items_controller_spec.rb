# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrderItemsController, type: :controller do
  describe 'DELETE #destroy' do
    subject { delete :destroy, params: { id: order_item.id } }
    let(:user) { create(:user) }

    before do
      VCR.use_cassette('stripe_customer_creation') do
        user
      end
    end
    
    let(:order) { create(:order, user: user) }
    let(:order_item) { create(:order_item, order:) }

    it 'deletes the order item' do
      subject
      expect(OrderItem.exists?(order_item.id)).to be_falsey
    end
  end
end
