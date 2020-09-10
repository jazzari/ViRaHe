Feature: Access the App as Admin
	In order to access restricted sections of the App
	As an admin user
	Should be able to log in
	
	Scenario: Admin signs in successfully
		Given I exist as an admin user
		And I am not logged in
		And I confirm the email
		When I sign in with valid credentials
		When I see a successful sign in message
		When I return to the site
		Then I should be signed in