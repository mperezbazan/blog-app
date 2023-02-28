require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  test_user = User.find(1)
  test_post = Post.create(
    author_id: test_user.id,
    title: 'Hello',
    text: 'This is my first post',
    comments_counter: 0,
    likes_counter: 0
  )
  describe 'GET /index' do
    it 'returns http success' do
      get "/users/#{test_user.id}/posts"
      expect(response).to have_http_status(:success)
    end
    it 'render the index template wit Posts list text' do
      get "/users/#{test_user.id}/posts"
      expect(response.body).to include('Posts list')
    end
    it 'render the index template' do
      get "/users/#{test_user.id}/posts"
      expect(response).to render_template('posts/index')
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get "/users/#{test_user.id}/posts/#{test_post.id}"
      expect(response).to have_http_status(:success)
    end
    it 'render the show template with Post details text' do
      get "/users/#{test_user.id}/posts/#{test_post.id}"
      expect(response.body).to include('Post detail')
    end
    it 'render the show template' do
      get "/users/#{test_user.id}/posts/#{test_post.id}"
      expect(response).to render_template('posts/show')
    end
  end
end
