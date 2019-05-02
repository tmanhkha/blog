require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  describe '#new' do
    it 'render new template' do
      get :new
      expect(response).to render_template(:new)
      expect(response).to have_http_status(200)
      expect(assigns(:contact)).to be_a_new(Contact)
    end
  end

  describe '#create' do
    let(:params_contact)  do
      {
        name: 'testname',
        email: 'test@gmail.com',
        message: 'messagetest'
      }
    end
    let(:params_contact_invalid) do
      {
        name: '',
        email: 'test@gmil.com',
        message: 'messagetest'
      }
    end
    it 'params contact valid' do
      expect(ContactJob).to receive(:perform_later).with(
        'name' => 'testname',
        'email' => 'test@gmail.com',
        'message' => 'messagetest'
      )

      post :create, params: { contact: params_contact }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to root_path
      expect(flash[:notice]).to eq('Your contact has sent successfully')
    end

    it 'render new with invalid' do
      post :create, params: { contact: params_contact_invalid }
      expect(response).to render_template(:new)
      expect(flash[:danger]).to eq('Your contact was not valid!')
    end
  end
end
