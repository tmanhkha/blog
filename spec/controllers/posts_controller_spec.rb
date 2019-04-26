require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe '#new' do
    let(:user) { FactoryBot.create(:user) }
    it 'return status 302' do
      sign_in user
      get :new, data: nil
      expect(response).to have_http_status(302)
    end
  end
end
