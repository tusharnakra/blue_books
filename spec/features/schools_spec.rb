require 'rails_helper'

feature "Schools", :type => :feature do
  
  def create_and_login
    # Create an object only once per description
    school_1 = School.create(name: "SEAS")
    email_group_1 = Group.create(name: "Admin")
    @user = Member.create!(email_address: "example@example.com", first_name: "Testy", last_name: "McUserton" , pennkey: "tesla", school_id: school_1.id, group_id: email_group_1.id, email: "example@example.com", password: "changeme", password_confirmation: "changeme")
    visit '/members/sign_in'
    fill_in "member_email", :with => "example@example.com"
    fill_in "member_password", :with => "changeme"
    click_button "Sign in"
  end
  
  describe "DELETE school" do
    it "should be able to delete school" do
      create_and_login
      school = School.create(name: "SAS")
      expect {School.destroy school}.to change(School, :count).by(-1)
    end
  end
  
  describe "GET index" do
    it "should get index" do
      create_and_login
      visit eval("schools_path")
      expect(page).to have_content 'Schools'
    end
  end
  
  
end
