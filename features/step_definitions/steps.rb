### UTILITY METHODS ###

def create_visitor
  @visitor ||= { :name => "Testy McUserton", :email => "example@example.com",
    :password => "changeme", :password_confirmation => "changeme" }
end

def create_admin
  create_visitor
  delete_user
  school_1 = School.create(name: "SEAS")
  email_group_1 = Group.create(name: "Admin")
  @user = Member.create!(email_address: @visitor[:email], first_name: "Testy", last_name: "McUserton" , pennkey: "tesla", school_id: school_1.id, group_id: email_group_1.id, email: @visitor[:email], password: @visitor[:password], password_confirmation: @visitor[:password_confirmation])
end

def create_user
  create_visitor
  delete_user
  school_1 = School.create(name: "SEAS")
  email_group_1 = Group.create(name: "Email Group 1")
  @user = Member.create!(email_address: @visitor[:email], first_name: "Testy", last_name: "McUserton" , pennkey: "tesla_user", school_id: school_1.id, group_id: email_group_1.id, email: @visitor[:email], password: @visitor[:password], password_confirmation: @visitor[:password_confirmation])
end

def delete_user
  @user ||= Member.where(:email => @visitor[:email]).first
  @user.destroy unless @user.nil?
end

def sign_in
  visit '/members/sign_in'
  fill_in "member_email", :with => @visitor[:email]
  fill_in "member_password", :with => @visitor[:password]
  click_button "Sign in"
end

Given /^I exist as a user$/ do
  create_user
end

Given /^I do not exist as a user$/ do
  create_visitor
  delete_user
end

Given /^I am not logged in$/ do
  visit '/'
end

When /^I sign in with valid credentials$/ do
  sign_in
end

Then /^I see an invalid login message$/ do
  page.should have_content "Invalid email or password."
end

Then /^I should be signed out$/ do
  page.should have_content "Sign up"
  page.should have_content "Sign in"
  page.should_not have_content "Logout"
end

Then /^I see a successful sign in message$/ do
  page.should have_content "Signed in successfully."
end

When /^I return to the site$/ do
  visit '/'
end

Then /^I should be signed in$/ do
  page.should have_content "Logout"
  page.should_not have_content "Sign up"
  page.should_not have_content "Login"
end

When /^I sign in with a wrong email$/ do
  @visitor = @visitor.merge(:email => "wrong@example.com")
  sign_in
end

When /^I sign in with a wrong password$/ do
  @visitor = @visitor.merge(:password => "wrongpass")
  sign_in
end

###################################Feature : Request Access ######################################
Given(/^I'm on the request submission page$/) do
  create_user
  sign_in
  visit eval("new_request_access_path")
end

When(/^I add a new request$/) do
  fill_in 'Subject', :with => "Levine Hall Bluebook write access"
  fill_in 'Description', :with => "I am the supervisor of Levine hall and would like to request write access to Levine hall's bluebook."
  email_group_0 = Group.create(name: "Admin")
  school_1 = School.create(name: "SEAS")
  Member.create!(email_address: "fileshare597@gmail.com", first_name: "File", last_name: "Share" , pennkey: "test", school_id: school_1, group_id: email_group_0.id, email: 'fileshare597@gmail.com', password: '12345678', password_confirmation: '12345678')
  click_button 'Create Request access'
end


Then(/^I should see the confirmation of email sent$/) do
  assert page.has_content?("Request was successfully sent.")
end

When(/^I add a new request with no subject$/) do
  fill_in 'Description', :with => "I am the supervisor of Levine hall and would like to request write access to Levine hall's bluebook."
  click_button 'Create Request access'
end

Then(/^I should see errors on the page$/) do
  assert page.has_css?('div.field_with_errors')
end

When(/^I add a new request with no description$/) do
  fill_in 'Subject', :with => "Levine Hall Bluebook write access"
  click_button 'Create Request access'
end

###################################Feature : Manage Groups ######################################


Given(/^I'm on the email group creation page$/) do
  create_admin
  sign_in
  visit eval("new_group_path")
end

When(/^I add a new email group$/) do
  fill_in 'Name', :with => "EmailGroup1"
  click_button 'Create Group'
end

Then(/^I should see the confirmation of email group's creation$/) do
  assert page.has_content?("Group was successfully created.")
end


When(/^I add a new email group with no name$/) do
  click_button 'Create Group'
end

Given(/^There already exists a group$/) do
  create_admin
  sign_in
  Group.create(name: "EG 2")
end

Given(/^I'm on the group update page$/) do
  group_id = Group.find(:all, :conditions => ["name LIKE ?", "EG 2"]).first[:id]
  visit "/groups/#{group_id}/edit"
end

Then(/^I should see the updated group name$/) do
  School.find(:all, :conditions => ["name LIKE ?", "EG 3"])
end

# ###################################Feature : Manage Schools ######################################


Given(/^I'm on the school creation page$/) do
  create_admin
  sign_in
  School.create(name: "SEAS")
  visit eval("new_school_path")
end

When(/^I add a new school$/) do
  fill_in 'Name', :with => "SAS"
  click_button 'Create School'
end

Then(/^I should see the confirmation of school's creation$/) do
  assert page.has_content?("School was successfully created.")
end

When(/^I add a new school with no name$/) do
  click_button 'Create School'
end

When(/^I add a new school which already exists$/) do

  fill_in 'Name', :with => "SEAS"
  click_button 'Create School'
end

Given(/^There already exists a school$/) do
  create_admin
  sign_in
  school = School.create(name: "SEAS")
end

Given(/^I'm on the school update page$/) do
  school_id = School.find(:all, :conditions => ["name LIKE ?", "SEAS"]).first[:id]
  visit "/schools/#{school_id}/edit"
end

When(/^I update the school name$/) do
  fill_in 'Name', :with => "SAS"
  click_button 'Update School'
end

Then(/^I should see the updated school name$/) do
  School.find(:all, :conditions => ["name LIKE ?", "SAS"])
end



###################################Feature : Manage Members ######################################


Given(/^I'm on the member creation page$/) do
  create_admin
  sign_in
  school_1 = School.create(name: "SEAS")

  Member.create!(email_address: "ntushar@seas.upenn.edu", first_name: "Tushar", last_name: "Nakra" , pennkey: "tusharn", school_id: school_1.id, email: "ntushar@seas.upenn.edu", password: '12345678', password_confirmation: '12345678')

  visit eval("new_member_path")
end

When(/^I add a new member$/) do

  fill_in 'Pennkey', :with => "adit"
  fill_in 'First name', :with => "addition"
  fill_in 'Last name', :with => "subtraction"
  fill_in 'Email address', :with => "adit@seas.upenn.edu"
  select('SEAS', :from => "School")
  click_button 'Create Member'
end

Then(/^I should see the confirmation of a member's creation$/) do
  assert page.has_content?("Member was successfully created.")
end

When(/^I add a new member with no first name$/) do
  #pending # express the regexp above with the code you wish you had

  fill_in 'Pennkey', :with => "adit"
  fill_in 'Last name', :with => "subtraction"
  fill_in 'Email address', :with => "adit@seas.upenn.edu"
  select('SEAS', :from => "School")
  click_button 'Create Member'
end

When(/^I add a new member with no last name$/) do
  #pending # express the regexp above with the code you wish you had

  fill_in 'Pennkey', :with => "adit"
  fill_in 'First name', :with => "addition"
  fill_in 'Email address', :with => "adit@seas.upenn.edu"
  select('SEAS', :from => "School")
  click_button 'Create Member'
end

When(/^I add a new member with no pennkey$/) do
  #pending # express the regexp above with the code you wish you had

  fill_in 'First name', :with => "addition"
  fill_in 'Last name', :with => "subtraction"
  fill_in 'Email address', :with => "adit@seas.upenn.edu"
  select('SEAS', :from => "School")
  click_button 'Create Member'
end

When(/^I add a new member with no email address$/) do
  #pending # express the regexp above with the code you wish you had

  fill_in 'Pennkey', :with => "adit"
  fill_in 'First name', :with => "addition"
  fill_in 'Last name', :with => "subtraction"
  select('SEAS', :from => "School")
  click_button 'Create Member'
end

When(/^I add a new member with a duplicate pennkey$/) do
  #pending # express the regexp above with the code you wish you had


  fill_in 'Pennkey', :with => "tusharn"
  fill_in 'First name', :with => "addition"
  fill_in 'Last name', :with => "subtraction"
  fill_in 'Email address', :with => "adit@seas.upenn.edu"
  select('SEAS', :from => "School")
  click_button 'Create Member'
end

When(/^I add a new member with a duplicate email address$/) do
  #pending # express the regexp above with the code you wish you had

  fill_in 'Pennkey', :with => "nt"
  fill_in 'First name', :with => "addition"
  fill_in 'Last name', :with => "subtraction"
  fill_in 'Email address', :with => "ntushar@seas.upenn.edu"
  select('SEAS', :from => "School")
  click_button 'Create Member'
end

When(/^I add a new member with an invalid email address$/) do
  fill_in 'Pennkey', :with => "nt"
  fill_in 'First name', :with => "addition"
  fill_in 'Last name', :with => "subtraction"
  fill_in 'Email address', :with => "ntushar.seas.upenn.edu"
  select('SEAS', :from => "School")
  click_button 'Create Member'
end

Given(/^I'm on the manage members page$/) do
  create_admin
  sign_in
  school_1 = School.create(name: "SEAS")
  Member.create!(email_address: "ntushar@seas.upenn.edu", first_name: "Tushar", last_name: "Nakra" , pennkey: "tusharn", school_id: school_1.id, email: "ntushar@seas.upenn.edu", password: '12345678', password_confirmation: '12345678')
  visit eval("members_path")
end

When(/^I search for a member using their first name$/) do
  fill_in 'fnsearch', :with => "Tushar"
  click_button 'Search'
end

Then(/^I should see results whose first name matches the query$/) do
  assert page.has_content?("Tushar")
end

When(/^I search for a member using their last name$/) do
  fill_in 'lnsearch', :with => "Nakra"
  click_button 'Search'
end

Then(/^I should see results whose last name matches the query$/) do
  assert page.has_content?("Nakra")
end

When(/^I search for a member using their pennkey$/) do
  fill_in 'pksearch', :with => "tusharn"
  click_button 'Search'
end

Then(/^I should see results whose pennkey matches the query$/) do
  assert page.has_content?("tusharn")
end

When(/^I search for a member using their email address$/) do
  fill_in 'easearch', :with => "ntushar@seas.upenn.edu"
  click_button 'Search'
end

Then(/^I should see results whose email address matches the query$/) do
  assert page.has_content?("ntushar@seas.upenn.edu")
end

Given(/^I' am on the member update member$/) do
  create_admin
  sign_in
  school_1 = School.create(name: "SEAS")
  member = Member.create!(email_address: "ntushar@seas.upenn.edu", first_name: "Tushar", last_name: "Nakra" , pennkey: "tusharn", school_id: school_1.id, email: "ntushar@seas.upenn.edu", password: '12345678', password_confirmation: '12345678')
  visit eval("edit_member_path(member)")
end

When(/^I update an attribute of the member$/) do
  fill_in 'First name', :with => 'asd'
  click_button "Update Member"
end

Then(/^I should see the confirmation of the member being updated$/) do
  assert page.has_content?("Member was successfully updated.")
end

###################################Feature : Manage Books ######################################

Given(/^I'm on the book addition page$/) do
  create_admin
  sign_in
  school_1 = School.create(name: "SEAS")
  Member.create!(email_address: "ntushar@seas.upenn.edu", first_name: "Tushar", last_name: "Nakra" , pennkey: "tusharn", school_id: school_1.id, email: "ntushar@seas.upenn.edu", password: '12345678', password_confirmation: '12345678')
  visit eval("new_book_path")
end

When(/^I add a new book$/) do
  fill_in 'Name', :with => "Levine_test.pdf"
  attach_file('book_attachment', File.join(Rails.root, "public/app/assets/Levine.pdf"))
  click_button 'Save'
end

Then(/^I should see the confirmation of book's addition$/) do
  assert page.has_content?("The book Levine_test.pdf has been uploaded.")
end

When(/^I add a new book with no name$/) do
  attach_file('book_attachment',File.join(Rails.root, "/public/app/assets/Levine.pdf"))
  click_button 'Save'
end

When(/^I add a new book which already exists$/) do
  fill_in 'Name', :with => "Levine.pdf"
  attach_file('book_attachment',File.join(Rails.root, "/public/app/assets/Levine.pdf"))
  click_button 'Save'
  visit eval("new_book_path")
  fill_in 'Name', :with => "Levine.pdf"
  attach_file('book_attachment',File.join(Rails.root, "/public/app/assets/Levine.pdf"))
  click_button 'Save'
end

When(/^I add a book without attachment$/) do
  fill_in 'Name', :with => "Levine_test.pdf"
  click_button 'Save'
end

Given(/^I'm on the books index page$/) do
  create_admin
  sign_in
  school_1 = School.create(name: "SEAS")
  Member.create!(email_address: "ntushar@seas.upenn.edu", first_name: "Tushar", last_name: "Nakra" , pennkey: "tusharn", school_id: school_1.id, email: "ntushar@seas.upenn.edu", password: '12345678', password_confirmation: '12345678')
  visit eval("new_book_path")
  fill_in 'Name', :with => "Levine_test"
  attach_file('book_attachment', File.join(Rails.root, "public/app/assets/Levine.pdf"))
  click_button 'Save'
  visit eval("books_path")
end

When(/^I search for a book by name$/) do
  fill_in 'book_search', :with => 'Levine_test'
  click_button 'Search'
end

Then(/^I should see the result whose name matches the query$/) do
  assert page.has_content?("Levine_test")
end

When(/^I update an already existing book$/) do
  book = Book.first
  visit update_path(book)
  attach_file('book_attachment', File.join(Rails.root, "public/app/assets/Moore.pdf"))
  click_button 'Save'
end

When(/^I update an already existing book as user$/) do
  book = Book.first
  visit update_path(book)
  fill_in 'send_document_subject', :with => 'Request for Book Update'
  fill_in 'send_document_description', :with => 'Attached.'
  attach_file('send_document_attachment', File.join(Rails.root, "public/app/assets/Moore.pdf"))
  click_button 'Submit for approval'
end

Then(/^I should see the confirmation of book's updation$/) do
  assert page.has_content?("The book Levine_test has been updated.")
end

Then(/^I should see the confirmation of email sent for approval$/) do
  assert page.has_content?("Document was sent for approval.")
end

Given(/^I'm on the books index page logged in as user$/) do
  create_admin
  sign_in
  school_2 = School.create(name: "SAS")
  # email_group_0 = Group.create(name: "Admin")
  Member.create!(email_address: "fileshare597@gmail.com", first_name: "File", last_name: "Share" , pennkey: "test", school_id: school_2, group_id: '1', email: 'fileshare597@gmail.com', password: '12345678', password_confirmation: '12345678')
  visit eval("new_book_path")
  fill_in 'Name', :with => "Levine_test"
  attach_file('book_attachment', File.join(Rails.root, "public/app/assets/Levine.pdf"))
  click_button 'Save'
  click_link 'Logout'
  create_user
  sign_in
  visit eval("books_path")
end

When(/^click on the book's name$/) do
  click_link Book.first[:name]
end

Then(/^I should see the contents of the book$/) do
  assert page.has_content?(Book.first[:name])
end