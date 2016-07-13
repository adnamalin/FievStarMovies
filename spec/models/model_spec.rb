require 'rails_helper'

describe Movie do
  let(:movie) { Movie.create(title: "Star Trek", director: "Susie", description: "Space!", release_date: "1960-08-13") }

  describe "has attributes" do
    context "you call title" do
      it "it has a title" do
        expect(movie.title).to eq "Star Trek"
      end
    end

    context "it has no reviews yet" do
      it "has total count of 0" do
        expect(movie.number_of_reviews).to eq 0
      end
    end

  end

end
