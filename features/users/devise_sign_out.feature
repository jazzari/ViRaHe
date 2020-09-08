Feature: Sign out
	To protect my account from unauthorized access
	A signed in user
	Shoud be able to sign out
	
	Scenario: User signs out
		Given I am logged in
		When I sign out
		Then I should see a sign out message
