# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::Availability::ProductsController, type: :controller do
  let(:category) { create(:category) }
  let(:product) { create(:product, category:) }
  let(:store) { create(:store) }
  let!(:menu) { create(:menu, product: product, store: store) }
  let(:menu_group) { store.menus.includes(product: :category).group_by { |menu| menu.product.category } }

  describe 'GET #index' do
    subject { get :index, params: { store_name: store.name } }

    it 'assigns all the product availabilities to @menu for a specific store' do
      subject
      expect(assigns(:menus_by_category)).to eq(menu_group)
    end
  end

  describe 'PATCH #update' do
  end
end
