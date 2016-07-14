require 'rails_helper'

describe ReviewsController do
  let(:movie) {Movie.create!(title: "Straight Outta Compton", description: "Straight Outta Compton is a 2015 American biographical drama film that chronicles the rise and fall of the Compton, California hip hop music group N.W.A.", director: "Ice-T", release_date: "2015-08-14")}

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
      it "find movie" do
        post :create, movie_id: movie.id, review:{movie_rating: 2,title:"Mock Review",body: "Some text here"}
        expect(assign[:movie]).to eq movie
      end

      it "renders redirects to movie" do
        post :create, movie_id: movie.id, review:{movie_rating: 2, title:"Mock Review",body: "Some text here"}
        expect(response).to have_current_path movie_path(movie)
      end
    end
  end

end
