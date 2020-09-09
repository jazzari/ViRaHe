Feature: Edit User
	As a registered user
	I want to edit my user profile
	So I can change my info

	Scenario: I sign in and edit my email
		Given I am logged in
		And I confirm the email
		When I sign in with valid credentials
		And I edit my account
		And I save the edit form
		Then I should see an account updated message
	
	Scenario: I sign in and edit with invalid email
		Given I am logged in
		And I confirm the email
		When I sign in with valid credentials
		When I edit with an invalid email address
		And I save the edit form
		Then I should see an invalid email message	

	Scenario: I sign in and edit my password
		Given I am logged in
		And I confirm the email
		When I sign in with valid credentials
		When I edit my password
		And I save the edit form
		Then I should see an account updated message
	
	Scenario: I sign in and edit my password with missing confirmation
		Given I am logged in
		And I confirm the email
		When I sign in with valid credentials
		When I edit my password with missing confirmation
		And I save the edit form
		Then I should see a mismatched password message
	
	Scenario: I sign in and edit my password with mismatched confirmation
		Given I am logged in
		And I confirm the email
		When I sign in with valid credentials
		When I edit my password with mismatched confirmation
		And I save the edit form
		Then I should see a mismatched password message
		
	Scenario: I sign in and edit without current password
		Given I am logged in
		And I confirm the email
		When I sign in with valid credentials
		When I edit my account
		And I don't enter my current password
		And I save the edit form
		Then I should see a password missing message

