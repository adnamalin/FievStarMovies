require 'rails_helper'

describe PagesController do

  describe 'GET #index' do
    it ' respinds with status 200' do
      get :index
      expect(response).to have_http_status 200
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
