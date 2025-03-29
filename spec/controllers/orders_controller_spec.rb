# frozen_string_literal: true

require 'rails_helper'
require 'vcr'

RSpec.describe OrdersController, type: :controller do
  include Devise::Test::ControllerHelpers

  before do
    VCR.use_cassette('stripe_customer_create') do
      @user = create(:user, stripe_id: 'cus_RNzSxzNYWd2eZ4')
    end
    sign_in @user
  end

  let(:user) { @user }
  let(:order) { create(:order, user:, state: 'paid') }
  let(:basket) { create(:order, user:, state: 'pending') }
  let(:product) { create(:product) }
  let!(:order_item) { create(:order_item, order: basket, product:) }

  describe 'GET #index' do
    let(:store_manager_role) { create(:role, uuid: 'store:manager') }

    before do
      user.roles << store_manager_role
    end

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
      before do
        VCR.use_cassette('stripe_customer_create') do
          @another_user = create(:user)
        end
      end

      let(:other_user) { @another_user }
      let(:other_order) { create(:order, user: other_user, state: 'paid') }

      it 'redirects to orders path with an alert' do
        get :show, params: { id: other_order.id }
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to eq("You don't have permission to view this page.")
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
    it 'assigns @order and @total' do
      VCR.use_cassette('order-checkout-stripe') do
        VCR.use_cassette('customer-session') do
          allow(user).to receive(:basket).and_return(basket)
          get :checkout
          expect(assigns(:order)).to eq(basket)
          expect(assigns(:total)).to eq(product.price)
        end
      end
    end

    it 'redirects to the cart if the basket is empty' do
      VCR.use_cassette('order-checkout-stripe') do
        VCR.use_cassette('customer-session') do
          create(:order, user:, state: 'pending')
          get :checkout
          expect(response).to redirect_to(cart_path)
        end
      end
    end
  end

  describe 'PATCH #update' do
    let!(:order) { create(:order, state: 'requires_capture', user: user, payment_intent: 'pi_3QXMmnFWpgsj4fDK2CNTkBBl') }
    before do
      allow(PrintReceiptService).to receive(:new).and_return(double(send: true))
    end

    it 'updates the order state to paid' do
      VCR.use_cassette('payment_capture') do
        patch :update, params: { id: order.id, action_type: 'check_in' }
        order.reload
        expect(order.state).to eq('paid')
      end
    end
  end
end
