Feature: Update Books

	As a User
	I want to download and update books
	so that I can inform Admin of the recent changes
	
	Scenario: Update an existing book
		Given I'm on the books index page logged in as user
		When I update an already existing book
		And "fileshare597@gmail.com" should receive an email
		Then I should see the confirmation of book's updation