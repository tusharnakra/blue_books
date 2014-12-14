require 'rails_helper'

feature "Schools", :type => :feature do
  
  def create_and_login
    # Create an object only once per description
    @schools = []
    school_1 = School.create(name: "SEAS")
    @schools << school_1
    email_group_1 = Group.create(name: "Admin")
    @user = Member.create!(email_address: "example@example.com", first_name: "Testy", last_name: "McUserton" , pennkey: "tesla", school_id: school_1.id, group_id: email_group_1.id, email: "example@example.com", password: "changeme", password_confirmation: "changeme")
    visit '/members/sign_in'
    fill_in "member_email", :with => "example@example.com"
    fill_in "member_password", :with => "changeme"
    click_button "Sign in"
  end
  
  describe "GET index" do
    it "should get index" do
      create_and_login
      visit eval("schools_path")
      @schools.each do |school|
          page.should have_content(school.name)
        end
    end
  end
  
  describe "DELETE school" do
    it "should be able to delete school" do
      create_and_login
      visit eval("schools_path")
      expect {click_link 'Delete'}.to change(School, :count).by(-1)
    end
  end
   
  describe "Show Members In school" do
    it "should show all members in a school" do
      create_and_login
      visit show_members_in_school_path(@schools[0])
      page.should have_content(@schools[0].name)
      page.should have_content(@user[:email])
    end
  end
end