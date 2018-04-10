require 'rails_helper'

RSpec.describe Api::V1::UsersController, api: true, type: :controller do
  include ApiDoc::V1::Users::Api

  let(:user) { create(:user) }
  let(:fake_user) { attributes_for(:user) }

  describe 'GET #index' do
    include ApiDoc::V1::Users::Index

    it 'returns a list of users', :dox do
      get :index

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    include ApiDoc::V1::Users::Show

    context 'when user is exist' do
      it 'returns a single user', :dox do
        get :show, params: { id: user }

        expect(response).to have_http_status(:ok)
      end
    end

    context 'when user is not exist' do
      it 'does not return any user', :dox do
        get :show, params: { id: 'invalid_id' }

        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'POST #create' do
    include ApiDoc::V1::Users::Create

    context 'with valid params' do
      it 'creates a new user', :dox do
        expect { post :create, params: fake_user }.to change(User, :count).by(1)
      end

      it 'returns 201 status' do
        post :create, params: fake_user

        expect(response).to have_http_status(201)
      end
    end

    context 'with invalid params', :dox do
      it 'returns unprocessable entity' do
        post :create, params: fake_user.update(email: nil)

        expect(response).to have_http_status(422)
      end

      it 'does not create a new book' do
        expect { post :create, params: fake_user.update(email: nil) }.to_not change(User, :count)
      end
    end
  end

  describe 'PUT #update' do
    include ApiDoc::V1::Users::Update

    context 'with valid params' do
      it 'updates the user', :dox do
        put :update, params: { id: user, email: 'updated@email.com' }

        expect(user.reload.email).to eq 'updated@email.com'
      end

      it 'returns 200 status' do
        put :update, params: { id: user, email: 'updated@email.com' }

        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid params', :dox do
      it 'returns unprocessable entity' do
        put :update, params: { id: user, email: nil }

        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'DELETE #destroy' do
    include ApiDoc::V1::Users::Destroy

    it 'returns 204 status', :dox do
      delete :destroy, params: { id: user }

      expect(response).to have_http_status(204)
    end
  end
end