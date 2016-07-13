require 'rails_helper'

describe ReviewsController do
  before(:each) do
    movie = Movie.create!(title: "The Titanic")
    movie.reviews = Review.create!(title: "It was okay", body: "somebody", reviewer_id: 1)
    User.create!(username: "vi")
  end

  describe "GET #index" do
    it "responds with status code 200" do
      get :index, {:movie_id => 1}
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "assigns the reviews for this movie as @reviews" do
      get :index, {:movie_id => 1}
      expect(assigns(:reviews)).to eq(Movie.find_by(params[:id].reviews))
    end

    it "renders the :index template" do
      get :index, {:movie_id => 1}
      expect(response).to render_template(:index)
    end
  end
end
