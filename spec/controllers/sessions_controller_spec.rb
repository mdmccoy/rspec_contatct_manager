require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before(:each) do
    @request.env["omniauth.auth"] = {
      'provider' => 'twitter',
      'info' => {'name'=>'Alice Smith'},
      'uid' => 'abc123'
    }
  end

  describe "GET #create" do
    it "returns http redirect" do
      get :create
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "#create" do
    it "creates a user from twitter data" do

      post :create
      user = User.find_by(uid:'abc123',provider:'twitter')
      expect(user.name).to eq('Alice Smith')
    end

    it "doesn't create duplicate users" do
      post :create
      post :create

      expect(User.count).to eq(1)
    end

    it "logs the new user in" do
      post :create

      user = User.find_by(provider:'twitter',uid:'abc123')
      expect(controller.current_user.id).to eq(user.id)
    end

    it 'logs in an exisiting user' do
      User.create(provider:'twitter',uid:'abc123',name:'Alice Smith')

      post :create

      user = User.find_by(provider:'twitter',uid:'abc123')
      expect(controller.current_user.id).to eq(user.id)
    end

    it 'redirects to the companies page' do
      post :create
      expect(response).to redirect_to(root_path)
    end
  end

end
