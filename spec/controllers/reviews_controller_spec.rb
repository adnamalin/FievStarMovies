require 'rails_helper'

describe ReviewsController do
  describe "GET #index" do
    it "responds with status code 200" do
      Movie.create!(title: "Dumb & Dumber", description: "A very funny movie", director: "John Smith", release_date: "1992-11-18")
      get :index, {:movie_id => 1}
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "assigns the reviews for this movie as @reviews" do
      Movie.create!(title: "Dumb & Dumber", description: "A very funny movie", director: "John Smith", release_date: "1992-11-18")
      get :index, {:movie_id => 1}
      expect(assigns(:reviews)).to eq(Movie.find(1).reviews)
    end

    it "renders the :index template" do
      Movie.create!(title: "Dumb & Dumber", description: "A very funny movie", director: "John Smith", release_date: "1992-11-18")
      get :index, {:movie_id => 1}
      expect(response).to render_template(:index)
    end
  end
end
