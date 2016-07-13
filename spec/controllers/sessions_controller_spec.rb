require 'rails_helper'

describe SessionsController do
  describe "Get #new" do
    describe "valid credentials and logs in" do
      it "responds with status code 200" do
        get :new
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders the :new template" do
        get :new
        expect(response).to render_template(:new)
      end
    end
  end

  describe "POST #create" do
  before(:each) do
    User.create!(username:"vi", password:"1234")
  end

    describe "valid crendentails allows you to log in" do
      it "logging in populates session[:user_id]" do
        expect { post :create, { user: { username: "vi", password: "1234" }} }.to change { session[:user_id] }
      end
    end
  end

   xdescribe "POST #create" do
  before(:each) do
    User.create!(username:"vi", password:"1234")
  end

    describe "logging out" do
      it "log out wipes out session[:user_id]" do
        expect { get:destory }.to change { session[:user_id] }
      end
    end
  end
end
