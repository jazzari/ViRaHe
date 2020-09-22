Feature: AdminUser can see Cars
	In order to manage cars in the App
	As an Admin
	I should be able to see then in the Dashboard

	Scenario: Admin can see cars
		Given I exist as an admin user
		And I am logged in as an admin
		When I visit the admin dashboard
		Then I should see the cars button 
