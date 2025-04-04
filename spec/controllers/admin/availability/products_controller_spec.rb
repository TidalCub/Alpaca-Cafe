# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::Availability::ProductsController, type: :controller do
  let(:category) { create(:category) }
  let(:product) { create(:product, category:) }
  let(:store) { create(:store) }
  let!(:menu) { create(:product_stock, product: product, store: store) }
  let(:menu_group) { store.product_stocks.includes(product: :category).group_by { |menu| menu.product.category } }
  let(:user) { create(:user, role_name: 'admin') }

  before do
    sign_in user
  end

  describe 'GET #index' do
    subject { get :index, params: { store_name: store.slug } }

    it 'assigns all the product availabilities to @menu for a specific store' do
      subject
      expect(assigns(:product_stocks_by_category)).to eq(menu_group)
    end
  end

  describe 'PATCH #update' do
    subject { patch :update, params: { store_name: store.name, store_id: store.id, menu_items: { menu.id => available } } }

    context 'when updating to available' do
      let(:available) { 1 }
      it 'updates the availability of the product' do
        subject
        expect(menu.reload.available).to be_truthy
      end
    end

    context 'when updating to unavailable' do
      let(:available) { 0 }
      it 'updates the availability of the product' do
        subject
        expect(menu.reload.available).to be_falsey
      end
    end
  end
end
