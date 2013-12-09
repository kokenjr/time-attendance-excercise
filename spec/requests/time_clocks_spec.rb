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
    click_button "Clock In/Out"
    page.should have_content("You are clocked in!")
  end

  it "clocks user in when they put in id" do
    user = FactoryGirl.create(:user)
    visit root_path
    fill_in "Employee ID", :with => user.employee_id
    click_button "Clock In/Out"
    page.should have_content("You are clocked out!")
  end

end
