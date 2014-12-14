require 'rails_helper'
require_relative '../../app/uploaders/attachment_uploader'

feature "Books", :type => :feature do
  # describe BooksController, type: :controller do
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

  # describe "POST /subscriber_imports" do
#     let(:file) { { :file => fixture_file_upload('/files/Levine.pdf', 'text/pdf') } }
#     subject { post :create, :subscriber_import => file }
#   end

  # it "can upload a book" do
#     create_and_login
#     @file = fixture_file_upload('/files/Levine.pdf', 'text/pdf')
#
#     visit eval("new_book_path")
#     fill_in 'Name', :with => "Levine_test.pdf"
#     # temp = File.open('somewhere')
#     # p Rails.root +  "/spec/fixtures/files/Levine.pdf"
#     # attach_file('attachment',  File.join(Rails.root, '/spec/fixtures/files/Levine.pdf'))
#     attach_file('book_attachment', '/Users/Shallav/Desktop/Fall 2014/CIT597/CIT_Project/blue_books/spec/fixtures/files/Levine.pdf')
#     click_button 'Save'
#   end



  describe "GET index" do
    it "should get index" do
      create_and_login
      visit eval("books_path")
      expect(page).to have_content 'Books'
    end
  end

  describe "GET directory " do
    it "checks the storage directory for uploader" do
      attachment_uploader = AttachmentUploader.new
      directory = attachment_uploader.store_dir
      expect(directory).to eq 'app/assets'
    end
  end
end
