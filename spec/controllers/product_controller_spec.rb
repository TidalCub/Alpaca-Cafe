# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductController, type: :controller do
  describe 'POST #add_to_basket' do
    before do
      VCR.use_cassette('stripe_customer_create') do
        @user = create(:user)
      end
      sign_in @user
    end

    let(:user) { @user }
    let!(:product) { create(:product) }
    let(:store) { create(:store) }
    let(:ingredient_group) { product.ingredient_groups.first }
    let(:ingredient) { ingredient_group.ingredients.first }
    let!(:order) { create(:order, user: user, store: store) }

    context 'when adding a product to the basket' do
      it 'creates an order item' do
        expect do
          post :add_to_basket, params: { product: product.id }
        end.to change(OrderItem, :count).by(1)
      end

      context 'when modifying the product' do
        it 'creates a product modifier if ingredient is not default' do
          allow(Ingredient).to receive(:find).and_return(ingredient)
          allow(ingredient).to receive(:is_default).and_return(false)

          expect do
            post :add_to_basket, params: { product: product.id, ingredient_group.name => ingredient.id }
          end.to change(ProductModifyer, :count).by(1)
        end

        it 'does not create a product modifier if ingredient is default' do
          allow(Ingredient).to receive(:find).and_return(ingredient)
          allow(ingredient).to receive(:is_default).and_return(true)

          expect do
            post :add_to_basket, params: { product: product.id, ingredient_group.name => ingredient.id }
          end.not_to change(ProductModifyer, :count)
        end
      end
    end
  end
end
