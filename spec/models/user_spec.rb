require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#VALIDATIONS" do 

  	it "should have valid factory" do 
  		user = FactoryBot.build :user
  		expect(user).to be_valid
  	end

  	
  	describe "#EMAIL" do 
	  	it "should require an email address" do 
	  		no_email_user = FactoryBot.build :user
	  		no_email_user.email = ""
	  		expect(no_email_user).not_to be_valid
	  	end

	  	it "should reject invalid email address" do 
	  		emails = ["SOME_USER_exmaple_org", "new user@foo", "user&foo,org"]
	  		emails.each do |mail|
	  			invalid_email_user = FactoryBot.build :user, email: mail 
	  			expect(invalid_email_user).not_to be_valid
	  		end
	  	end

	  	it "should accept valid email address" do 
	  		emails = ["user@example.org", "SOME_USER@exmaple.bar.org", "new.user@foo.yp"]
	  		emails.each do |mail|
	  			valid_email_user = FactoryBot.build :user, email: mail 
	  			expect(valid_email_user).to be_valid
	  		end
	  	end

	  	it "should reject duplicated email" do
	  		user1 = FactoryBot.create :user 
	  		user_duplicated_email = FactoryBot.build :user, email: user1.email
	  		expect(user_duplicated_email).not_to be_valid
	  	end
  	end

  	describe "#PASSWORDS" do 
  		before(:each) do 
  			@user = FactoryBot.build :user 
  		end

  		it "should have a password attribute" do 
  			expect(@user).to respond_to(:password)
  		end

  		 it "should have a password confirmation attribute" do 
  			expect(@user).to respond_to(:password_confirmation)
  		end

  		it "should require a password" do 
  			new_user = @user 
  			new_user.password = ""
  			expect(new_user).not_to be_valid
  		end

  		it "should require a password confirmation" do 
  			new_user = @user 
  			new_user.password_confirmation = ""
  			expect(new_user).not_to be_valid
  		end

  		it "should require a matching password confirmation" do 
  			new_user = @user 
  			new_user.password_confirmation = "somepassword"
  			expect(new_user).not_to be_valid
  		end

  		it "should reject short password" do 
  			pass = "a" * 5
  			@user.password = pass 
  			@user.password_confirmation = pass 
  			expect(@user).not_to be_valid
  		end
  	end

    describe "#ADMIN" do 
      before(:each) do 
        @user = FactoryBot.build :user 
      end

      it "should have an admin attribute" do 
        expect(@user).to respond_to(:admin)
      end
    end

  end
end
