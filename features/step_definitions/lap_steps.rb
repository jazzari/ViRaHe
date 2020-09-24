
	## GIVEN ##


	## WHEN ##

When /^I click the "([^"]*)" button$/ do |button|
	save_and_open_page
	click_button(button)
end


	## THEN ##

