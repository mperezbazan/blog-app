require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users'
      expect(response).to have_http_status(:success)
    end
    it 'render the index template wit User list text' do
      get '/users'
      expect(response.body).to include('Here is the list of users')
    end
    it 'render the index template' do
      get '/users'
      expect(response).to render_template('users/index')
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/1'
      expect(response).to have_http_status(:success)
    end
    it 'render the show template with User details text' do
      get '/users/1'
      expect(response.body).to include('User details')
    end
    it 'render the show template' do
      get '/users/1'
      expect(response).to render_template('users/show')
    end
  end
end
