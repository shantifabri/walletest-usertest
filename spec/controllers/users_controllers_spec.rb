# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #show' do
    let(:test_user) { create(:user) }

    before { get :show, params: { id: test_user.id } }

    it { is_expected.to respond_with(200) }
    it { is_expected.to render_template('show') }
  end

  describe 'GET #index' do
    let(:test_user) { create(:user, admin: true) }

    before do
      sign_in test_user
      get :index
    end

    it { is_expected.to respond_with(200) }
    it { is_expected.to render_template('index') }
  end

  describe 'GET #index as non admin' do
    let(:test_user) { create(:user) }

    before do
      sign_in test_user
      get :index
    end

    it { is_expected.to redirect_to root_path }
  end

  describe 'GET #edit' do
    let(:test_user) { create(:user) }

    before do
      sign_in test_user
      get :edit, params: { id: test_user.id }
    end

    it { is_expected.to respond_with(200) }
    it { is_expected.to render_template('edit') }
  end

  describe 'PUT #update' do
    let(:user) { create(:user) }
    let(:user2) { create(:user) }
    let(:params) do
      { id: user.id,
        user: { email: 'valid@email' } }
    end
    let(:invalid_params) do
      { id: user.id,
        user: { email: 'invalid' } }
    end

    it 'updates user if valid' do
      sign_in user
      post :update, params: params
      expect(user.reload.email).to eq(params[:user][:email])
    end

    it 'redirects to show on succes' do
      sign_in user
      post :update, params: params
      expect(response).to redirect_to(user_path(id: user.id))
    end

    it 'does not update an invalid user' do
      post :update, params: invalid_params
      old_email = user.email
      expect(user.reload.email).to eq(old_email)
    end

    it 'renders edit on fail' do
      sign_in user
      post :update, params: invalid_params
      expect(response).to render_template(:edit)
    end

    it 'redirect to root if you don\'t have permissions' do
      sign_in user2
      post :update, params: params
      expect(response).to redirect_to root_path
    end
  end

  describe 'DELETE #destroy' do
    let!(:user) { create(:user, admin: true) }
    let(:user2) { create(:user) }

    it 'deletes user' do
      sign_in user
      expect { post :destroy, params: { id: user.id } }
        .to change(User, :count).by(-1)
    end

    it 'redirects to index' do
      sign_in user
      post :destroy, params: { id: user.id }
      expect(response).to redirect_to(users_path)
    end

    it 'redirect to root if you don\'t have permissions' do
      sign_in user2
      post :destroy, params: { id: user2.id }
      expect(response).to redirect_to root_path
    end
  end
end
