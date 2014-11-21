Feature: Manage Email Groups

	As an Administrator
	I want to manage email groups
	so that I can choose who is to be informed about certain updates.

	Scenario: Add an email group
		Given I'm on the email group creation page
		When I add a new email group
		Then I should see the confirmation of email group's creation 
		 
	Scenario: Add an email address
		Given I'm on the email address addition page
		When I add a new email address
		Then I should see the confirmation of email address's creation
		
	Scenario: Add an email group without name
		Given I'm on the email group creation page
		When I add a new email group with no name
		Then I should see errors on the page
		
	Scenario: Add an email address without name
		Given I'm on the email address addition page
		When I add a new email address with no name
		Then I should see errors on the page
		
	Scenario: Add an email address which does not satisfy "local-part@domain" syntax
		Given I'm on the email address addition page
		When I add a new email address in incorrect format
		Then I should see errors on the page
	