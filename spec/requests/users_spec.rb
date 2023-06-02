require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users/sign_in' do
    it 'returns a successful response' do
      get '/users/sign_in'
      expect(response).to have_http_status(:success)
    end

    it 'displays the login page' do
      get '/users/sign_in'
      expect(response.body).to include('LOG IN')
    end
  end
end
