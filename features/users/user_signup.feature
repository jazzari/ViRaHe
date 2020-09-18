Feature: User Sign Up
	In order to get access to protected sections of the App
	A visitor to the App's Home Page
	Sould be able to sign up

	Scenario: User signs up with Facebook
		Given I do not exist as a user
		When I visit the Home Page
		When I follow "Sign up"
		Then I should see a "Sign in with Facebook" link
	
	Scenario: User signs up with Google
		Given I do not exist as a user
		When I visit the Home Page
		When I follow "Sign up"
		Then I should see a "Sign in with GoogleOauth2" link
