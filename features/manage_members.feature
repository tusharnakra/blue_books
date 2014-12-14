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
		
	Scenario: Add an email address in incorrect format
		Given I'm on the member creation page
		When I add a new member with an invalid email address
		Then I should see errors on the page		

	Scenario: Search for a member
		Given I'm on the manage members page
		When I search for a member using their first name
		Then I should see results whose first name matches the query


	Scenario: Search for a member
		Given I'm on the manage members page
		When I search for a member using their last name
		Then I should see results whose last name matches the query
		
		
	Scenario: Search for a member
		Given I'm on the manage members page
		When I search for a member using their pennkey
		Then I should see results whose pennkey matches the query
		
	Scenario: Search for a member
		Given I'm on the manage members page
		When I search for a member using their email address
		Then I should see results whose email address matches the query

	Scenario: Update a member
		Given I' am on the member update member
		When I update an attribute of the member
		Then I should see the confirmation of the member being updated
