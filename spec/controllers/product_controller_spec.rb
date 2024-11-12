# spec/controllers/product_controller_spec.rb
require 'rails_helper'

RSpec.describe ProductController, type: :controller do
  describe 'POST #add_to_basket' do
    let(:user) { create(:user) }
    let(:product) { create(:product) }
    let(:ingredient_group) { IngredientGroup.first }
    let(:ingredient) { Ingredient.first }

    before do
      product
      sign_in user
    end

    context 'when adding a product to the basket' do
      it 'creates an order item' do
        expect do
          post :add_to_basket, params: { product: product.id }
        end.to change(OrderItem, :count).by(1)
      end

      it 'redirects back to the previous page' do
        request.env['HTTP_REFERER'] = categories_path
        post :add_to_basket, params: { product: product.id }
        expect(response).to redirect_to(categories_path)
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
