###################################Feature : Request Access ######################################
Given(/^I'm on the request submission page$/) do
  visit eval("new_request_access_path")
end

When(/^I add a new request$/) do
  fill_in 'Subject', :with => "Levine Hall Bluebook write access"
  fill_in 'Description', :with => "I am the supervisor of Levine hall and would like to request write access to Levine hall's bluebook."
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







###################################Feature : Manage Email Groups ######################################


Given(/^I'm on the email group creation page$/) do
  visit eval("new_email_group_path")
end

When(/^I add a new email group$/) do
  fill_in 'Name', :with => "EmailGroup1"
  click_button 'Create Email group'
end

Then(/^I should see the confirmation of email group's creation$/) do
  assert page.has_content?("Email group was successfully created.")
end

Given(/^I'm on the email address addition page$/) do
  visit eval("new_email_address_path")
end

When(/^I add a new email address$/) do
  fill_in 'Name', :with => "abc@domain.xyz"
  fill_in 'Email group', :with => "1"
  click_button 'Create Email address'
end

Then(/^I should see the confirmation of email address's creation$/) do
  assert page.has_content?("Email address was successfully created.")
end

When(/^I add a new email group with no name$/) do
  click_button 'Create Email group'
end

When(/^I add a new email address with no name$/) do
  click_button 'Create Email address'
end

When(/^I add a new email address with no email group$/) do
  fill_in 'Name', :with => "abc@domain.xyz"
  click_button 'Create Email address'
end

When(/^I add a new email address in incorrect format$/) do
  fill_in 'Name', :with => "abc@domain"
  click_button 'Create Email address'
  #pending # express the regexp above with the code you wish you had
end