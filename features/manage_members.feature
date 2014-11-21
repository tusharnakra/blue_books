Feature: Manage Members

	As an Administrator
	I want to manage members
	so that I can keep a record of the members' information

	Scenario: Add an member
		Given I'm on the member creation page
		When I add a new member
		Then I should see the confirmation of a member's creation 
		 
	Scenario: Add a member without first name
		Given I'm on the member creation page
		When I add a new member with no first name
		Then I should see errors on the page

	Scenario: Add a member without last name
		Given I'm on the member creation page
		When I add a new member with no last name
		Then I should see errors on the page
	
	Scenario: Add a member without pennkey
		Given I'm on the member creation page
		When I add a new member with no pennkey
		Then I should see errors on the page

	Scenario: Add a member without email address
		Given I'm on the member creation page
		When I add a new member with no email address
		Then I should see errors on the page				
		
	Scenario: Add a pre-existing pennkey
		Given I'm on the member creation page
		When I add a new member with a duplicate pennkey
		Then I should see errors on the page

	Scenario: Add a pre-existing email address
		Given I'm on the member creation page
		When I add a new member with a duplicate email address
		Then I should see errors on the page	