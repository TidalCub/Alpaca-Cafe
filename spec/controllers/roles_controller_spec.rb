# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RolesController, type: :controller do
  let(:user) { create(:user, role_name: 'admin') }
  let(:role) { create(:role) }
  let(:admin_role) { Role.find_by(uuid: 'admin') }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'assigns all roles to @roles' do
      role2 = create(:role)
      get :index
      expect(assigns(:roles)).to match_array([role, role2, admin_role])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested role to @role' do
      get :show, params: { id: role.id }
      expect(assigns(:role)).to eq(role)
    end

    it 'renders the show template' do
      get :show, params: { id: role.id }
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #new' do
    it 'assigns a new role to @role' do
      get :new
      expect(assigns(:role)).to be_a_new(Role)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new role' do
        expect do
          post :create, params: { role: { name: Faker.name } }
        end.to change(Role, :count).by(1)
      end

      it 'redirects to the roles index' do
        post :create, params: { role: { name: Faker.name } }
        expect(response).to redirect_to(roles_path)
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      it 'updates the role' do
        patch :update, params: { id: role.id, role: { name: 'Updated Name' } }
        role.reload
        expect(role.name).to eq('Updated Name')
      end

      it 'redirects to the role' do
        patch :update, params: { id: role.id, role: { name: 'Updated Name' } }
        expect(response).to redirect_to(role)
      end
    end
  end
end
