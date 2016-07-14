require 'rails_helper'

describe Movie do
  let(:movie_with_reviews_and_ratings) do
    movie = Movie.create!(title: "Star Trek", director: "Susie", description: "Space!", release_date: "1960-08-13")
    3.times do
      movie.ratings.create!(rating: 5)
    end
    movie
  end

  describe "attributes" do
    context "when movie is made" do
      it "it has a title" do
        p movie_with_reviews_and_ratings.reviews
        expect(movie_with_reviews_and_ratings.title).to eq "Star Trek"
      end
    end

    context "when movie has no reviews" do
      it "it has 0 reviews" do
        expect(movie_with_reviews_and_ratings.reviews.length).to eq 0
      end
    end

    context "when movie has three 5-cheese ratings" do
      it "has total cheese average of 5" do
        expect(movie_with_reviews_and_ratings.average_rating).to eq 5.0
      end
    end

  end

end
