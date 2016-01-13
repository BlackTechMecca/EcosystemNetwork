require 'rails_helper'

RSpec.describe UserConnectionController, :type => :controller do

  describe "GET create" do
    it "creates a new connection when current_user is requestee" do
      login_user

      connection_request = FactoryGirl.create(:connection_request, :requestee_id => current_user.id)

      expect do 
        get :create, { :requester_id => connection_request.requester_id, :requestee_id => connection_request.requestee_id }
      end.to_change { ConnectionRequest.count }.by(1)
      expect(response).to be_success
    end

    it "does not create a new connection if requestee is not current_user" do
      login_user

      connection_request = FactoryGirl.create(:connection_request)

      expect do 
        post :create, { :requester_id => connection_request.requester_id, :requestee_id => connection_request.requestee_id }
      end.to_not change { ConnectionRequest.count }
      expect(response.code).to be 401
    end
  end

  describe "GET destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to be_success
    end
  end
end
