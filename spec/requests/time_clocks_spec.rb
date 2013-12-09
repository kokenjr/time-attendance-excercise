require 'spec_helper'

describe "TimeClocks" do
  #describe "GET /time_clocks" do
  #  it "works! (now write some real specs)" do
  #    # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
  #    get time_clocks_path
  #    response.status.should be(200)
  #  end
  #end
  it "clocks user in when they put in id" do
    user = FactoryGirl.create(:user)
    visit root_path
    fill_in "Employee ID", :with => user.employee_id
    FactoryGirl.create(:work_time, :user => user, :clocked_out_at => nil)
    click_button "Clock In/Out"
    page.should have_content("You are clocked in!")
    page.should have_content("Clocked In: #{user.work_times.last.clocked_in_at}")
  end

  it "clocks user out when they put in id" do
    user = FactoryGirl.create(:user, :status => "CLOCKED IN")
    FactoryGirl.create(:work_time, :user => user, :clocked_out_at => nil)
    visit root_path
    fill_in "Employee ID", :with => user.employee_id
    click_button "Clock In/Out"
    page.should have_content("You are clocked out!")
    page.should have_content("Clocked Out: #{user.work_times.last.clocked_out_at}")
    page.should have_content("Total Time Worked: #{time_diff(user.work_times.last.clocked_out_at, user.work_times.last.clocked_in_at)}")
  end

  it "manages users" do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link "Manage Users"
    page.should have_content("#{user.first_name} #{user.last_name}")
  end

  it "adds user" do
    visit users_path
    click_link "Add User"
    fill_in "First name", :with => "John"
    fill_in "Last name", :with => "Doe"
    fill_in "Employee ID", :with => "jdoe"
    select "EMPLOYEE", :from => "Role"
    click_button "Add User"
    page.should have_content("John Doe")
  end

  it "deletes user" do
    user = FactoryGirl.create(:user)
    visit users_path
    click_link "Delete"
    page.should have_content("Users")
    page.should_not have_content("#{user.first_name} #{user.last_name}")
  end

  it "shows admin work times for all users" do
    admin = FactoryGirl.create(:admin)
    FactoryGirl.create(:work_time, :user => admin)
    user = FactoryGirl.create(:user, :status => "CLOCKED OUT")
    FactoryGirl.create(:work_time, :user => user)
    visit root_path
    fill_in "Employee ID", :with => admin.employee_id
    page.should have_content("#{user.first_name} #{user.last_name}")
    page.should have_content("Clocked In: #{user.work_times.last.clocked_in_at} | Clocked Out: #{user.work_times.last.clocked_out_at}")
  end

end
