require 'rails_helper'

describe MoviesController do
  describe "GET #show" do
    it "redirects to movies/id/reviews" do
      get :show, {:id => 1}
      expect(response).to redirect_to(movie_reviews_path(1))
    end
  end
end
