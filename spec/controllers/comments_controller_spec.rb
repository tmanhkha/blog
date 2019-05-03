require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  before do
    @user  = FactoryBot.create(:user)
    @post = FactoryBot.create(:post)
    @comment = FactoryBot.create(:comment)
  end

  describe '#create' do
    let(:post_test) { FactoryBot.create(:post)}
    context 'user sign in' do
      it 'create comment successfully' do
        sign_in @user
        post :create, params: { comment: { content: 'content test'}, post_id: post_test.id }, format: :js
        expect(response).to have_http_status(200)
        expect(post_test.comments.count).to eq(1)  
      end
    end

    context 'user not sign in' do
      it 'require sign in' do
        post :create, params: { comment: { content: 'content test'}, post_id: post_test.id }
        expect(response).to have_http_status(302)
      end
    end
  end

  describe '#edit' do
    context 'user sign in' do
      it 'render edit' do
        sign_in @user
        get :edit, params: { id: @comment.id, post_id: @post.id }
        expect(response).to render_template(:edit)
      end
    end

    context 'user not sign in' do
      it 'require sign in' do
        get :edit, params: { id: @comment.id, post_id: @post.id }
        expect(response).to have_http_status(302)
      end
    end
  end

  describe '#update' do
    context 'user sign in' do
      it 'update successfully' do
        sign_in @user
        put :update, params: { comment: { content: 'update content'}, post_id: @post.id, id: @comment.id }
        expect(response).to have_http_status(302)
        expect(@comment.reload.content).to eq('update content')
      end
    end

    context 'user not sign in' do
      it 'require sign in' do
        put :update, params: { comment: { content: 'update content'}, post_id: @post.id, id: @comment.id }
        expect(response).to have_http_status(302)
      end
    end
  end
end
