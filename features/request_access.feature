Feature: Request Access

	As a User
	I want to request the administrator for a higher access privilege
	so that I can view/modify the documents which I am not allowed to see or update.
	
	Scenario: Add a request
		Given I'm on the request submission page
		When I add a new request
		Then I should see the confirmation of email sent
		 
	Scenario: Add a request without subject
		Given I'm on the request submission page
		When I add a new request with no subject
		Then I should see errors on the page
		
	Scenario: Add a request without description
		Given I'm on the request submission page
		When I add a new request with no description
		Then I should see errors on the page
	