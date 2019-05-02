require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
  end
  describe '#show' do
    context 'user sign in' do
      it 'render show user' do
        sign_in @user
        get :show, params: { id: @user.id }
        expect(response).to have_http_status(200)
        expect(response).to render_template(:show)
        expect(subject.current_user).to eq @user
      end
    end

    context 'user not sign in' do
      it 'require sign in' do
        get :show, params: { id: @user.id }
        expect(response).to have_http_status(302)
        expect(subject.current_user).to be nil
      end
    end
  end

  describe '#update' do
    context 'user sign in' do
      it 'update successfully' do
        allow_any_instance_of(User).to receive(:update).and_return(true)
        sign_in @user
        put :update, params: { user: { avatar: 'test'}, id: @user.id}
        expect(response).to have_http_status(302)
        expect(flash[:notice]).to eq('Update avatar successfully')
      end

      it 'update unsuccessfully' do
        allow_any_instance_of(User).to receive(:update).and_return(false)
        sign_in @user
        put :update, params: { user: { avatar: 'test'}, id: @user.id}
        expect(response).to have_http_status(302)
        expect(flash[:danger]).to eq('Update avatar unsuccessfully')
      end
    end

    context 'user not sign in' do
      it 'require sign in' do
        put :update, params: { user: { avatar: 'test'}, id: @user.id}
        expect(response).to have_http_status(302)
      end
    end
  end
end
