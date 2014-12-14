Feature: Manage Books

	As an Administrator
	I want to manage books
	so that information is up-to-date

	# Scenario: Add a book
# 		Given I'm on the book addition page
# 		When I add a new book
# 		Then I should see the confirmation of book's addition
#
# 	Scenario: Add a book without name
# 		Given I'm on the book addition page
# 		When I add a new book with no name
# 		Then I should see errors on the page
#
# 	Scenario: Add a book with the pre-existing name
# 		Given I'm on the book addition page
# 		When I add a new book which already exists
# 		Then I should see errors on the page

	Scenario: Add a book without attachment
		Given I'm on the book addition page
		When I add a book without attachment
		Then I should see errors on the page