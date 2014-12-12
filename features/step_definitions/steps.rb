### UTILITY METHODS ###

def create_visitor
  @visitor ||= { :name => "Testy McUserton", :email => "example@example.com",
    :password => "changeme", :password_confirmation => "changeme" }
end

def create_user
  create_visitor
  delete_user
  school_1 = School.create(name: "SEAS")
  email_group_1 = Group.create(name: "Email Group 1")
  @user = Member.create!(email_address: @visitor[:email], first_name: "Testy", last_name: "McUserton" , pennkey: "tesla", school_id: school_1.id, group_id: email_group_1.id, email: @visitor[:email], password: @visitor[:password], password_confirmation: @visitor[:password_confirmation])
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
  create_user
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

# ###################################Feature : Manage Schools ######################################


Given(/^I'm on the school creation page$/) do
  create_user
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




###################################Feature : Manage Members ######################################


Given(/^I'm on the member creation page$/) do
  create_user
  sign_in
  school_1 = School.create(name: "SEAS")
  Member.create(email_address: "ntushar@seas.upenn.edu", first_name: "Tushar", last_name: "Nakra" , pennkey: "tusharn", school_id: school_1.id)

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