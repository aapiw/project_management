require 'rails_helper'

RSpec.describe "Frontends", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/frontend/index"
      expect(response).to have_http_status(:success)
    end
  end

end
