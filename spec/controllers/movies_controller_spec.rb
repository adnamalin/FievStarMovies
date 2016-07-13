require 'rails_helper'

describe MoviesController do
  describe "GET #show" do
    it "responds with status code 200" do
      get :show, {:movie_id => 1}
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders whatever is on movie_reviews_path" do
      get :show, {:movie_id => 1}
      expect(response).to render_template(:'reviews#index')
    end
  end
end
