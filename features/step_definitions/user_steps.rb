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


    ## GIVEN ##
Given /^I am not logged in$/ do 
	visit 'users/sign_in'
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

