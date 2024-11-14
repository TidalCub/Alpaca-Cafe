require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let(:user) { create(:user) }
  let(:order) { create(:order, user:, state: 'paid') }
  let(:basket) { create(:order, user:, state: 'pending') }
  let(:product) { create(:product) }
  let(:order_item) { create(:order_item, order: basket, product:) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'assigns @orders' do
      get :index
      expect(assigns(:orders)).to eq([order])
    end
  end

  describe 'GET #show' do
    context 'when the user owns the order' do
      it 'assigns @order' do
        get :show, params: { id: order.id }
        expect(assigns(:order)).to eq(order)
      end
    end

    context 'when the user does not own the order' do
      let(:other_user) { create(:user) }
      let(:other_order) { create(:order, user: other_user, state: 'paid') }

      it 'redirects to orders path with an alert' do
        get :show, params: { id: other_order.id }
        expect(response).to redirect_to(orders_path)
        expect(flash[:alert]).to eq("You don't have permission to view this order.")
      end
    end
  end

  describe 'GET #cart' do
    before do
      allow(user).to receive(:basket).and_return(basket)
      allow(basket).to receive(:order_items).and_return([order_item])
    end
    it 'assigns @items and @total' do
      get :cart
      expect(assigns(:items)).to eq([order_item])
    end
  end

  describe 'GET #checkout' do
    before do
      allow(user).to receive(:basket).and_return(basket)
    end

    it 'assigns @order and @total' do
      get :checkout
      expect(assigns(:order)).to eq(basket)
      expect(assigns(:total)).to eq(basket.order_items.sum(&:price))
    end
  end

  describe 'PATCH #update' do
    it 'updates the order state to paid' do
      patch :update, params: { id: basket.id }
      basket.reload
      expect(basket.state).to eq('paid')
    end
  end
end
