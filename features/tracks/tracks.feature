Feature: AdminUser can see Tracks
	In order to manage tracks in the App
	As an Admin
	I should be able to see then in the Dashboard
	@testing
	Scenario: Admin can see tracks
		Given I exist as an admin user
		And I am logged in as an admin
		When I visit the admin dashboard
		Then I should see the tracks button 
