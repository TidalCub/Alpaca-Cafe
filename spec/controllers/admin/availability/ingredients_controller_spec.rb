# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::Availability::IngredientsController, type: :controller do
  let(:category) { create(:category) }
  let(:store) { create(:store) }
  let(:ingredient) { create(:ingredient) }
  let!(:ingredient_stock) { create(:ingredient_stock, store: store, ingredient: ingredient) }
  let(:ingredient_stock_group) { store.ingredient_stocks.includes(ingredient: :ingredient_group).group_by { |ingredient_stocks| ingredient_stocks.ingredient.ingredient_group } }

  describe 'GET #index' do
    subject { get :index, params: { store_name: store.slug } }

    it 'assigns all the ingredients availabilities to @ingredients_stock for a specific store' do
      subject
      expect(assigns(:ingredients_stock_by_group)).to eq(ingredient_stock_group)
    end
  end

  describe 'PATCH #update' do
    subject { patch :update, params: { store_name: store.name, store_id: store.id, ingredient_stocks: { ingredient_stock.id => available } } }

    context 'when updating to available' do
      let(:available) { 1 }
      it 'updates the availability of the ingredient' do
        subject
        expect(ingredient_stock.reload.available).to be_truthy
      end
    end

    context 'when updating to unavailable' do
      let(:available) { 0 }
      it 'updates the availability of the ingredient' do
        subject
        expect(ingredient_stock.reload.available).to be_falsey
      end
    end
  end
end
