require 'rails_helper'

describe ReviewsController do
  describe "GET #index" do
    let(:movie) { Movie.create!(title: "Dumb & Dumber", description: "A very funny movie", director: "John Smith", release_date: "1992-11-18") }

    it "responds with status code 200" do
      get :index, {:movie_id => movie.id}
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "assigns the reviews for this movie as @reviews" do
      get :index, {:movie_id => movie.id}
      movie.reviews = [Review.create(title: "It was okay", body: "somebody", reviewer_id: 1)]
      expect(assigns(:reviews)).to eq(movie.reviews)
    end

    it "renders the :index template" do
      get :index, {:movie_id => movie.id}
      expect(response).to render_template(:index)
    end
  end
end
