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


	## THEN ##
Then /^I should see a successful sign up message$/ do 
	expect(page).to have_content "Welcome! You have signed up successfully."
end
