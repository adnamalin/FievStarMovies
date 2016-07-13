require 'rails_helper'

describe ReviewsController do
  describe "GET #index" do
    it "responds with status code 200" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "assigns the reviews for this movie as @reviews" do
      get :index
      expect(assigns(:reviews)).to eq(Movie.find_by(params[:id].reviews))
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
