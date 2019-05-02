require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe '#index' do
    let(:post) { FactoryBot.create(:post) }
    it 'render index' do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
      expect(assigns(:posts)).to eq([post])
    end
  end
  describe '#new' do
    let(:user) { FactoryBot.create(:user) }
    context 'user sign in' do
      it 'return status 200' do
        sign_in user
        get :new
        expect(response).to have_http_status(200)
        expect(response).to render_template(:new)
        expect(assigns(:post)).to be_a_new(Post)
      end
    end

    context 'user not sign in' do
      it 'return status 302' do
        get :new
        expect(response).to have_http_status(302)
      end
    end
  end

  describe '#create' do
    let(:user) { FactoryBot.create(:user) }
    post_params = { 
      post: {
        title: 'titletest',
        description: 'description_test'
      }
    }
    context 'user sign in' do
      before do
        sign_in user
      end

      it 'create post successfully' do
        post :create, params: post_params
        expect(response).to have_http_status(302)
        expect(user.posts.count).to eq(1)
        expect(flash[:notice]).to eq('Post was successfully created.')
      end

      it 'create post unsuccessfully' do
        post :create, params: { post: { title: ''}}
        expect(response).to render_template(:new)
        expect(user.posts.count).to eq(0)
      end
    end

    context 'user not sign in' do
      it 'require sign in' do
        post :create, params: post_params
        expect(response).to have_http_status(302)
      end
    end
  end

  describe '#edit' do
    let(:user) { FactoryBot.create(:user) }
    let(:post) { FactoryBot.create(:post)}
    context 'user sign in' do
      it 'render edit and return status 200' do
        sign_in user
        get :edit, params: { id: post.id }
        expect(response).to render_template(:edit)
        expect(response).to have_http_status(200)
      end
    end

    context 'user not sign in' do
      it 'require sign in' do
        get :edit, params: { id: post.id }
        expect(response).to have_http_status(302)
      end
    end
  end

  describe '#update' do
    let(:user) { FactoryBot.create(:user) }
    let(:post) { FactoryBot.create(:post)}
    post_params = {
      post: {
        title: 'titletest',
        description: 'description_test',
        image: 'https://previews.123rf.com/images/pandavector/pandavector1607/pandavector160700062/60025051-businessman-icon-flat-single-avatar-people-icon-from-the-big-avatar-collection-stock-vector.jpg'
      }
    }
    context 'user sign in' do
      before do
        sign_in user
      end

      it 'update post successfully' do
        put :update, params: post_params.merge!(id: post.id )
        expect(response).to have_http_status(302)
        expect(post.reload.title).to eq('titletest')
        expect(flash[:notice]).to eq('Post was successfully updated.')
      end

      it 'update post unsuccessfully' do
        allow_any_instance_of(Post).to receive(:update).and_return(false)
        put :update, params: post_params.merge!(id: post.id )
        expect(response).to render_template(:edit)
      end
    end

    context 'user not sign in' do
      it 'require sign in' do
        put :update, params: post_params.merge!(id: post.id )
        expect(response).to have_http_status(302)
      end
    end
  end

  describe '#destroy' do
    let(:user) { FactoryBot.create(:user) }
    let(:post) { FactoryBot.create(:post) }

    context 'user sign in' do
      it 'destroy post successfully' do
        sign_in user
        delete :destroy, params: { id: post.id }
        expect(response).to have_http_status(302)
        expect(user.posts.count).to eq(0)
        expect(flash[:notice]).to eq('Post was successfully destroyed.')
      end
    end

    context 'user not sign in' do
      it 'require sign in' do
        delete :destroy, params: { id: post.id }
        expect(response).to have_http_status(302)
        expect(post.present?).to be true
      end
    end
  end
end
