class OmniauthController < Devise::OmniauthCallbacksController

	def facebook
		@user = set_login("facebook")
	end

	def google_oauth2
		@user = set_login("google")
	end

end

private

def set_login(provider)
	@user = User.create_from_provider_data(request.env['omniauth.auth'])
	if @user.persisted?
		sign_in_and_redirect @user
		set_flash_message(:notice, :success, kind: "#{provider.capitalize}") if is_navigational_format?
	else
		message = "There was a problem in signing you in through #{provider.capitalize}. Please try signing in later"
		flash[:error] = message
		redirect_to new_user_registration_url
	end
end
