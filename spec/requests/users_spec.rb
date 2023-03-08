require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before :each do
    @user_test = User.first
  end
  describe 'GET /index' do
    it 'returns http success' do
      get '/users'
      expect(response).to have_http_status(:success)
    end
    it 'render the index template wit User list text' do
      get '/users'
      expect(response.body).to include(@user_test.name)
    end
    it 'render the index template' do
      get '/users'
      expect(response).to render_template('users/index')
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get "/users/#{@user_test.id}"
      expect(response).to have_http_status(:success)
    end
    it 'render the show template with User details text' do
      get "/users/#{@user_test.id}"
      expect(response.body).to include(@user_test.bio)
    end
    it 'render the show template' do
      get "/users/#{@user_test.id}"
      expect(response).to render_template('users/show')
    end
  end
end
