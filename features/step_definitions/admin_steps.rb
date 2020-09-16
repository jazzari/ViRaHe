

	## GIVEN ##

Given /^I am logged in as an admin$/ do
	create_admin_user
	sign_in 
	@adminuser.confirm
end

	## WHEN ##

When /^I visit the admin dashboard$/ do
	
	click_link "Go to Admin Panel"
end

When /^I resend confirmation instructions$/ do
	fill_in "Email", with: "visitor@example.org"
	click_button "Resend confirmation instructions"
	open_email("visitor@example.org")
	visit_in_email("Confirm my account") 
	@adminuser.confirm
end

	## THEN ##

Then /^I should see the simulators button$/ do 
	save_and_open_page 
	expect(page).to have_content("Simulators")
end
