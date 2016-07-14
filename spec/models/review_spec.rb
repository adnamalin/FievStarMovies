describe Review do
  let(:review) { Review.new(reviewer_id:1) }

  describe "average_rating" do
    it "gets the average rating of the review" do
      review.movie = Movie.create!(title: 'The Room', description: 'Johnny is a successful banker who lives happily in a San Francisco townhouse with his fiancée, Lisa. One day, inexplicably, she gets bored of him and decides to seduce Johnny\'s best friend, Mark. From there, nothing will be the same again.', director: 'Tommy Wiseau', release_date: Date.new(2003,6,27) )
      review.ratings = [Rating.new(rating:5), Rating.new(rating:4), Rating.new(rating:3), Rating.new(rating:4), Rating.new(rating:3), ]
      review.create_reviewer(username:"vi", password:"1234")
      expect(review.average_rating).to eq 3.8
    end
  end
end
