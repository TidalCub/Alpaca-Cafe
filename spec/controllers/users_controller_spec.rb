# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #edit' do
    let(:user) { create(:user) }

    context 'when the user is authenticated' do
      before do
        sign_in user
        get :edit, params: { id: user.id }
      end

      it 'assigns the requested user to @user' do
        expect(assigns(:user)).to eq(user)
      end

      it 'renders the edit template' do
        expect(response).to render_template(:edit)
      end

      it 'returns a successful response' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the user is not authenticated' do
      it 'redirects to the sign-in page' do
        get :edit, params: { id: user.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
