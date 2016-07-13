describe Review do
  let(:review) { Review.new(movie_id: 1, reviewer_id:1) }

  describe "average_rating" do
    it "gets the average rating of the review" do
      review.ratings = [Rating.new(rating:5), Rating.new(rating:4), Rating.new(rating:3), Rating.new(rating:4), Rating.new(rating:3), ]
      review.save
      expect(review.average_rating).to eq 3.8
    end
  end
end
