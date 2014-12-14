require 'rails_helper'


feature "Groups", :type => :feature do
  
  def create_and_login
    # Create an object only once per description
    @groups =[]
    school_1 = School.create(name: "SEAS")
    group = Group.create(name: "Temporary")
    email_group_1 = Group.create(name: "Admin")
    @groups << group
    @groups << email_group_1
    @user = Member.create!(email_address: "example@example.com", first_name: "Testy", last_name: "McUserton" , pennkey: "tesla", school_id: school_1.id, group_id: email_group_1.id, email: "example@example.com", password: "changeme", password_confirmation: "changeme")
    visit '/members/sign_in'
    fill_in "member_email", :with => "example@example.com"
    fill_in "member_password", :with => "changeme"
    click_button "Sign in"
  end
  
  describe "GET index" do
    it "should get index" do
      create_and_login
      visit eval("groups_path")
      @groups.each do |group|
          page.should have_content(group.name)
        end
    end
  end
  
  describe "DELETE group" do
    it "should be able to delete group" do
      create_and_login
      visit group_path(@groups[0])
      expect {click_link 'Delete'}.to change(Group, :count).by(-1)
    end
  end
  
  describe "Show Members In group" do
    it "should show all members in a group" do
      create_and_login
      visit showMembersInGroup_path(@groups[1])
      page.should have_content(@groups[1].name)
      page.should have_content(@user[:email])
    end
  end
end
