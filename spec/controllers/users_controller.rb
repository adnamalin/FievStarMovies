require 'rails_helper'

describe UsersController do
  describe "Get #new" do
    it "responds with status code 200" do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "sets @user to a new user in users#new" do
      get :new
      expect(assigns(:user)).to be_a_new User
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "when valid params are passed" do
      it "responds with status code 302" do
        post :create, { user: { username: "vi", password: "1234", password_confirmation: "1234" }}
        expect(response).to have_http_status(302)
      end

      it "takes form data and adds to database" do
        expect { post :create, { user: { username: "vi", password: "1234", password_confirmation: "1234" }} }.to change(User, :count).by(1)
      end

      it "@user is assigned the saved user" do
        post :create, { user: { username: "vi", password: "1234", password_confirmation: "1234" }}
        expect(assigns(:user)).to eq User.find_by(username:"vi")
      end

      it "user automatically signs in" do
        post :create, { user: { username: "vi", password: "1234", password_confirmation: "1234" }}
        expect(session[:user_id]).to eq User.find_by(username:"vi").id
      end

      it "redirects to the home page" do
        post :create, { user: { username: "vi", password: "1234", password_confirmation: "1234" }}
        expect(response).to redirect_to root_path
      end
    end
  end
end
