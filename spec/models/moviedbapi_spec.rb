require 'rails_helper'

describe Moviedbapi do
  let(:api) { Moviedbapi.new }
  it "can make a request to the api and turn it into a Movie object" do
    expect(api.find_movie(505)).to be_a Movie
  end

  it "can generate a image_link url (start with http(s):// and ends with .jpg)" do
    expect(api.image_link("104y3asf.jpg")).to match(/^https?:\S+[.jpg]/)
  end

  it "can search for any term and return a movie with that title" do
    search_term = "frozen"
    expect(api.search_movie(search_term)[0]["title"]).to eq search_term.capitalize
  end
end
