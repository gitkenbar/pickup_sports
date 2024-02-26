require 'rails_helper'

RSpec.describe "Sections", type: :request do
  describe "POST /login" do

    let(:user) { create(:user) }

    it "authenticaties the user and returns a success response" do
      post '/login', params: { username: user.username, password: user.password}

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to include('token')
    end

    it 'does not authenticate the user and returns an error' do
      post :create, params: {username: user.username, password: 'wrong_password'}
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
