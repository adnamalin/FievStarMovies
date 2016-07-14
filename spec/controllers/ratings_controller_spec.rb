require 'rails_helper'

describe RatingsController do
  let(:review) { Review.new(title: "It was okay", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ", reviewer_id: 1) }
  let(:user) { User.create!(username:"vi", password:"12345678") }
  let(:session) { {user_id: user.id} }
  before(:each) do
    movie = Movie.create!(title: "Dumb & Dumber", description: "A very funny movie", director: "John Smith", release_date: "1992-11-18")
    review.reviewer = user
    review.movie = movie
    review.movie_rating = Rating.new(rating:5)
    review.save!
  end

  describe 'GET #new' do
    it 'responds with status 200' do
      get :new, {review_id: review.id}, session

      expect(response).to have_http_status 200
    end

    it 'assigns @review with the review'  do
      get :new, {review_id: review.id}, session
      expect(assigns(:review)).to eq review
    end

    it "renders the :new template" do
      get :new, {review_id: review.id}, session
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    it 'responds with status 302' do
      post :create, {review_id: review.id, rating: {rating:5}}, session

      expect(response).to have_http_status 302
    end

    it 'persists the rating'  do
      post :create, {review_id: review.id, rating: {rating:5}}, session
      expect(review.ratings.last.rating).to eq 5
    end

    it "renders the :new template" do
      post :create, {review_id: review.id, rating: {rating:5}}, session
      expect(response).to redirect_to(movie_path(review.movie.id))
    end
  end
end
