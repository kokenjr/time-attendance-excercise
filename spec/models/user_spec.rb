require 'spec_helper'

describe User do
  it "should change user status to CLOCKED IN" do 
    user = FactoryGirl.create(:user)
    user.clock_in
    user.status.should == "CLOCKED IN"
  end
  
  it "should store clocked in time" do 
    user = FactoryGirl.create(:user)
    user.clock_in
    user.work_times.last.clocked_in_at.should_not be_nil
  end
end
