Feature: Sign In
	In order to get access to protected sections of the App
	A registered user
	Sould be able to sign in
	
	Scenario: User is not signed up
		Given I do not exist as a user
		When I sign in with valid credentials
		Then I see an invalid login message

	Scenario: User signs in successfully
		Given I exist as a user
		And I am not logged in
		And I confirm the email
		When I sign in with valid credentials
		When I see a successful sign in message
		When I return to the site
		Then I should be signed in
		Then I should not see the admin link

	Scenario: Admin user signs in successfully
		Given I exist as an admin user
		And I am not logged in
		And I confirm the email
		When I sign in with valid credentials
		When I see a successful sign in message
		When I return to the site
		Then I should see the admin link

	Scenario: User enters wrong email
		Given I exist as a user
		And I am not logged in		
		When I sign in with a wrong email
		And I should be signed out


	Scenario: User enters wrong password
		Given I exist as a user
		And I am not logged in		
		When I sign in with a wrong password
		And I should be signed out