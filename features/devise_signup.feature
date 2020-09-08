Feature: Devise Authentication

	In order to use the App
	As a user
	I should be able to sign up

	Background:
		Given I am not logged in

	Scenario: User signs up with valid data
		When I sign up with valid data
		Then I should see a successful sign up message
		
