require 'spec_helper'

describe UsersController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST create" do
      it "adds user" do
        post :create, :user => {first_name: "John", last_name: "Doe", employee_id: "jdoe", role: "EMPLOYEE"}
        response.should redirect_to users_path
      end
  end
  describe "DELETE destroy" do
    it "deletes user" do
      user = FactoryGirl.create(:user)
      expect{
        delete :destroy, id: user.id
      }.to change(User,:count)
      response.should redirect_to users_path
    end
  end

end
