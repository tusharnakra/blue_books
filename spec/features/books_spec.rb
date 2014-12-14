require 'rails_helper'

feature "Books", :type => :feature do
  describe BooksController, type: :controller do
  # include RSpec::Rails::ControllerExampleGroup
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
  
  # describe "DELETE books" do
#     it "should be able to delete school" do
#       create_and_login
#       group = Group.create(name: "SAS")
#       expect {Group.destroy group}.to change(Group, :count).by(-1)
#     end
#   end
    
  before :each do
    create_and_login
    # @file = fixture_file_upload('files/Levine.pdf', 'text/xml')
  end

  # describe "POST /subscriber_imports" do
#     let(:file) { { :file => fixture_file_upload('/files/Levine.pdf', 'text/pdf') } }
#     subject { post :create, :subscriber_import => file }
#   end

  it "can upload a book" do
    # visit eval("new_book_path")
#     fill_in 'Name', :with => "Levine_test.pdf"
    @file = fixture_file_upload('/files/Levine.pdf', 'text/xml')
    # temp = File.open('somewhere')
    # attach_file('attachment', @file)
    # click_button 'Save'
    post :create, :name => "Levine_test.pdf", :attachment => @file
    response.should be_success
  end
  
  
  
  # describe "GET index" do
#     it "should get index" do
#       create_and_login
#       visit eval("books_path")
#       expect(page).to have_content 'Books'
#     end
#   end
end
end
