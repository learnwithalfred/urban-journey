require 'rails_helper'

RSpec.describe 'Splashes', type: :request do
  describe 'GET /index' do
    before(:each) do
      get root_path
    end

    it 'returns http success' do
      get root_path
      expect(response).to have_http_status(:success)
    end

    it 'body should includes correct placeholder text' do
      expect(response.body).to include('Login')
    end

    it 'body should includes correct placeholder text' do
      expect(response.body).to include('Sign Up')
    end
  end
end
