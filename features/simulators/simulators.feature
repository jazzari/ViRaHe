Feature: AdminUser can see Simulators
	In order to manage simulators in the App
	As an Admin
	I should be able to see then in the Dashboard

	Scenario: Admin can see simulators
		Given I exist as an admin user
		And I am logged in as an admin
		And I confirm the email
		When I sign in with valid credentials
		When I visit the admin dashboard
		Then I should see the simulators button 
