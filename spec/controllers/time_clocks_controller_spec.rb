require 'spec_helper'

describe TimeClocksController do

  before(:each) do 
    @user = FactoryGirl.create(:user)
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "clocks user in" do
        post :create, employee_id: "kokenjr"
        response.should redirect_to :action => "status", :id => @user
      end
      it "clocks user out" do
        @user.update_attributes(status: "CLOCKED IN")
        FactoryGirl.create(:work_time, :user => @user, :clocked_out_at => nil)
        post :create, employee_id: "kokenjr"
        response.should redirect_to :action => "status", :id => @user
      end
    end

    context "with invalid attributes" do
      it "does not not clock in" do
        post :create, employee_id: "blahblah"
        response.should redirect_to root_path
      end
      it "does not not clock out" do
        @user.update_attributes(status: "CLOCKED IN")
        FactoryGirl.create(:work_time, :user => @user, :clocked_out_at => nil)
        post :create, employee_id: "blahblah"
        response.should redirect_to root_path
      end
    end
  end

  describe "GET status" do
    it "returns http success" do
      get :status, :id => @user.id
      response.should be_success
    end
  end
  
  describe "POST report" do
    it "returns http success" do
      post :report, :user_id => @user.id
      response.should be_success
    end
  end


end
