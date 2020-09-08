	## METHODS. ## 
def create_visitor
	@visitor ||= { name: "New Visitor" , email: "visitor@example.org",
		password: "password", password_confirmation: "password" }
end

def delete_user
	@user ||= User.where(email: @visitor[:email]).first
	@user.destroy unless @user.nil?
end

def sign_up
	delete_user
	visit '/users/sign_up'
	#fill_in "user_name", with: @visitor[:name] 
	fill_in "user_email", with: @visitor[:email]
	fill_in "user_password", with: @visitor[:password]
	fill_in "user_password_confirmation", with: @visitor[:password_confirmation]
	click_button "Sign up"
	find_user
end


def find_user
	@user ||= User.where(email: @visitor[:email]).first
end

def sign_in
	visit '/users/sign_in'
	fill_in "user_email", with: @visitor[:email]
	fill_in "user_password", with: @visitor[:password]
	click_button "Log in"
end

def create_user
	create_visitor
	delete_user
	@user = FactoryBot.create(:user)
end


    ## GIVEN ##
Given /^(?:|I )am not logged in$/ do 
	visit 'users/sign_in'
end

Given /^I do not exist as a user$/ do 
	create_visitor
	delete_user
end

Given /^I exist as a user$/ do 
	create_user
end

	## WHEN ##
When /^I sign up with valid data$/ do 
	create_visitor
	sign_up 
end

When /^I sign up with an invalid email$/ do 
	create_visitor
	@visitor = @visitor.merge(email: "invalidemail")
	sign_up
end

When /^I sign up without a password$/ do 
	create_visitor
	@visitor = @visitor.merge(password: "")
	sign_up
end

When /^I sign up without a password confirmation$/ do 
	create_visitor
	@visitor = @visitor.merge(password_confirmation: "")
	sign_up
end

When /^I sign up with a mismatched password confirmation$/ do 
	create_visitor
	@visitor = @visitor.merge(password_confirmation: "notapassword")
	sign_up
end

When /^I sign in with valid credentials$/ do
	create_visitor
	sign_in
end

When /^I see a successful sign in message$/ do 
	expect(page).to have_content "Signed in successfully"
end

When /^I return to the site$/ do
	visit '/' 
end

When /^I sign in with a wrong email$/ do 
	@visitor = @visitor.merge(email: "wrongemail@example.org")
end

When /^I sign in with a wrong password$/ do 
	@visitor = @visitor.merge(password: "wrongpassword")
end

	## THEN ##
Then /^I should see a successful sign up message$/ do 
	expect(page).to have_content "Welcome! You have signed up successfully."
end

Then /^I should see an invalid email message$/ do 
	expect(page).to have_content "Email is invalid"
end

Then /^I should see a missing password message$/ do 
	expect(page).to have_content "Password can't be blank"
end

Then /^I should see a missing password confirmation message$/ do 
	expect(page).to have_content "Password confirmation doesn't match Password"
end

Then /^I should see a mismatched password message$/ do 
	expect(page).to have_content "Password confirmation doesn't match Password"
end

Then /^I see an invalid login message$/ do 
	expect(page).to have_content "Sign up"
	expect(page).to have_content "Forgot your password?"
end

Then /^I should be signed in$/ do 
	expect(page).to have_content "Logout"
	expect(page).to have_content "Edit account"
end

Then /^I should be signed out$/ do 
	expect(page).to have_content "Sign up"
	expect(page).to have_content "Log in"
	expect(page).not_to have_content "Logout"
end

