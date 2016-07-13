require 'rails_helper'

describe UsersController do

  describe 'GET #new' do
    it ' respinds with status 200' do
      get :new
      expect(response).to have_http_status 200
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end
end
