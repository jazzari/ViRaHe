
	## GIVEN ##

Given /^I am logged in as an admin$/ do
	create_admin_user
	sign_in 
end

	## WHEN ##

When /^I visit the admin dashboard$/ do
	click_link "Go to Admin Panel"
end

	## THEN ##

Then /^I should see the simulators button$/ do 
	expect(page).to have_content("Simulators")
end

Then /^I should see the tracks button$/ do 
	expect(page).to have_content("Tracks")
end

Then /^I should see the cars button$/ do 
	expect(page).to have_content("Cars")
end