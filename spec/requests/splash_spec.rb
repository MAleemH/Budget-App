require 'rails_helper'

RSpec.describe 'Splash', type: :request do
  describe 'GET /' do
    it 'returns a successful response' do
      get '/'
      expect(response).to have_http_status(:success)
    end
  end
end
