require 'rails_helper'

RSpec.describe BooksController, :type => :controller do

  # def create_and_login
#     # Create an object only once per description
#     school_1 = School.create(name: "SEAS")
#     email_group_1 = Group.create(name: "Admin")
#     @user = Member.create!(email_address: "example@example.com", first_name: "Testy", last_name: "McUserton" , pennkey: "tesla", school_id: school_1.id, group_id: email_group_1.id, email: "example@example.com", password: "changeme", password_confirmation: "changeme")
#     visit '/members/sign_in'
#     fill_in "member_email", :with => "example@example.com"
#     fill_in "member_password", :with => "changeme"
#     click_button "Sign in"
#   end
  
  # before :each do
#     create_and_login
#     # @file = fixture_file_upload('files/Levine.pdf', 'text/xml')
#   end
  
  # it "can upload a license" do
 #    @file = fixture_file_upload('/files/Levine.pdf', 'text/xml')
 #    post :create, :attachment => @file, :name => 'Temp'
 #    response.should be_success
 #  end
  
end
