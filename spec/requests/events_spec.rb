require 'rails_helper'

RSpec.describe "Events", type: :request do
  let(:user) {create(:user)}
  let(:token) { auth_token_for_user(user)}
  # get events - index
  describe "GET /events" do
    it 'returns a response with all the event' do
      create(:event)
      get '/events', headers: { Authorization: "Bearer #{token}" }
      expect(response.body).to eq(Event.all.to_json)
    end
  end

  # get event - show
  describe "GET /event" do
    let (:event) { create(:event)}

    it "returns a response with a the specific event" do
      get "/events/#{event.id}", headers: { Authorization: "Bearer #{token}" }
      expect(response.body).to eq(event.to_json)
    end
  end
  # create event - create
  describe "POST /events" do
    let(:user) {create(:user)}
    let(:token) { auth_token_for_user(user)}
    let(:sport) {create(:sport)
  }
    
  end
  # update event - update

  # delete event - destroy

end
