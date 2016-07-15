require 'rails_helper'

describe ReviewsController do
  let(:movie) {Movie.create!(title: "Straight Outta Compton", description: "Straight Outta Compton is a 2015 American biographical drama film that chronicles the rise and fall of the Compton, California hip hop music group N.W.A.", director: "Ice-T", release_date: "2015-08-14")}
  let(:user) { User.create!(username:"vi", password:"1234") }
  let(:session) { {user_id: user.id} }

  describe "Get #new" do
    describe "responds with new form" do
      it "responds with status code 200" do
        get :new, movie_id: movie.id
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders the :new template" do
        get :new, movie_id: movie.id
        expect(response).to render_template(:new)
      end
    end
  end

  describe "Get #create" do
    describe "perisitng the new review" do
      it "can find movie" do
        movie.ratings.create!(rating:4, rater_id: user.id)
        post :create, {movie_id: movie.id, review:{title:"Mock Review",body: "Some text here", reviewer_id:user.id}}, session
        expect(assigns[:movie]).to eq movie
      end

      it "renders redirects to movie" do
        movie.ratings.create!(rating:4, rater_id: user.id)
        post :create, {movie_id: movie.id, review:{title:"Mock Review",body: "Some text here", reviewer_id:user.id}}, session
        expect(response).to redirect_to(movie_path(movie))
      end
    end
  end

end
