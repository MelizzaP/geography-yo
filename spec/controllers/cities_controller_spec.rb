require 'rails_helper'

RSpec.describe CitiesController, type: :controller do

  describe "GET /v1/states/:state/cities" do
    it "returns http success" do
      get :show, {'state' => 'AL'}
      expect(response).to have_http_status(:success)
    end
  end

end
