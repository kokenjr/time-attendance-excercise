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
  
  it "should change user status to CLOCKED OUT" do 
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:work_time, :user => user, :clocked_out_at => nil)
    user.clock_out
    user.status.should == "CLOCKED OUT"
  end
  
  it "should store clocked out time" do 
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:work_time, :user => user, :clocked_out_at => nil)
    user.clock_out
    user.work_times.last.clocked_out_at.should_not be_nil
  end
end
