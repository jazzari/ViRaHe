module OmniAuth
  OmniAuth.config.test_mode = true

  def facebook_hash
	OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
		'provider' => 'facebook',
	    'uid' => '12345',
	    'info' => {
                  'name' => 'tester',
                  'email' => 'tester@example.org'
	               }
		})
  end

end
