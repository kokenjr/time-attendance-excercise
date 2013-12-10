require 'spec_helper'

describe User do

  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  it "should change user status to CLOCKED IN" do 
    @user.clock_in
    @user.status.should == "CLOCKED IN"
  end
  
  it "should store clocked in time" do 
    @user.clock_in
    @user.work_times.last.clocked_in_at.should_not be_nil
  end
  
  it "should change user status to CLOCKED OUT" do 
    FactoryGirl.create(:work_time, :user => @user, :clocked_out_at => nil)
    @user.clock_out
    @user.status.should == "CLOCKED OUT"
  end
  
  it "should store clocked out time" do 
    FactoryGirl.create(:work_time, :user => @user, :clocked_out_at => nil)
    @user.clock_out
    @user.work_times.last.clocked_out_at.should_not be_nil
  end

  it "should get time worked the past week" do
    FactoryGirl.create(:work_time, :user => @user, :clocked_in_at => 3.days.ago, :clocked_out_at => 3.days.ago)
    @user.time_worked_past_week.count.should == 1
  end
  it "should not get time worked the past week" do
    FactoryGirl.create(:work_time, :user => @user, :clocked_in_at => 2.weeks.ago, :clocked_out_at => 2.weeks.ago)
    @user.time_worked_past_week.count.should == 0
  end
end
