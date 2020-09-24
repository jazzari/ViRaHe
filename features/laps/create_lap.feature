Feature: 
	In order to add my TimeLaps to the App
	A registered user
	Sould be able to register a TimeLap
	@testing
	Scenario: User register a TimeLap
		Given I exist as a user
		And I am logged in
		When I click the "Add LapTime" button
		And I fill the fields with valid data
		When I click the "Create Lap" button
		Then I see "created Lap" message