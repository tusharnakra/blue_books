Feature: Manage Schools

	As an Administrator
	I want to manage schools
	so that I can categorize users based on the schools that they are affiliated with.

	Scenario: Add an school
		Given I'm on the school creation page
		When I add a new school
		Then I should see the confirmation of school's creation 
		 
	Scenario: Add a school without name
		Given I'm on the school creation page
		When I add a new school with no name
		Then I should see errors on the page
		
	Scenario: Add a pre-existing school
		Given I'm on the school creation page
		When I add a new school which already exists
		Then I should see errors on the page

	Scenario: Update a pre-existing school
		Given There already exists a school
		Given I'm on the school update page
		When I update the school name
		Then I should see the updated entry

		