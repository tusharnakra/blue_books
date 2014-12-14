require 'rails_helper'


feature "Groups", :type => :feature do
  
  def create_and_login
    # Create an object only once per description
    @groups =[]
    @users = []
    school_1 = School.create(name: "SEAS")
    group = Group.create(name: "Temporary")
    email_group_1 = Group.create(name: "Admin")
    @groups << group
    @groups << email_group_1
    @user = Member.create!(email_address: "example@example.com", first_name: "Testy", last_name: "McUserton" , pennkey: "tesla", school_id: school_1.id, group_id: email_group_1.id, email: "example@example.com", password: "changeme", password_confirmation: "changeme")
    @user2 = Member.create!(email_address: "example2@example.com", first_name: "Testy2", last_name: "McUserton2" , pennkey: "tesla2", school_id: school_1.id, group_id: group.id, email: "example2@example.com", password: "changeme", password_confirmation: "changeme")
    @users << @user2
    @users << @user

    visit '/members/sign_in'
    fill_in "member_email", :with => "example@example.com"
    fill_in "member_password", :with => "changeme"
    click_button "Sign in"

  end
  
  
  describe "DELETE member" do
    it "should be able to a delete member" do
      create_and_login
      visit member_path(@users[0])
      expect {click_link 'Delete'}.to change(Member, :count).by(-1)
    end
  end
  
  
end
