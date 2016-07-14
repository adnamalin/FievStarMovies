require "rails_helper"

RSpec.describe "Routing to the application", :type => :routing do
  it "GET / routes to movies#index" do
    expect(:get => "/").to route_to("movies#index")
  end

  it "GET /movies/:id routes to movies#show" do
    expect(:get => "/movies/1").to route_to(
      controller: 'movies', action: 'show', id: "1")
  end
  
  it "GET /users/new routes to users#new" do
    expect(:get => "/users/new").to route_to("users#new")
  end
  
  it "POST /users routes to users#create" do
    expect(:post => "/users").to route_to("users#create")
  end
  
  it "GET /login routes to sessions#new" do
    expect(:get => "/login").to route_to("sessions#new")
  end
  
  it "GET /logout routes to sessions#destroy" do
    expect(:get => "/logout").to route_to("sessions#destroy")
  end
end
