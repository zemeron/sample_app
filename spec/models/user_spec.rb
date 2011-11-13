require 'spec_helper'

describe User do
	before(:each) do
	    @attr = {
	      :name => "Example User",
	      :email => "user@example.com",
	      :password => "foobar",
	      :password_confirmation => "foobar"
	    }
  	end

  	it "should create a new instance given valid attributes" do
    	User.create!(@attr)
  	end
	
	describe "password validations" do

	    it "should require a password" do
	      User.new(@attr.merge(:password => "", :password_confirmation => "")).
	        should_not be_valid
	    end
	
	    it "should require a matching password confirmation" do
	      User.new(@attr.merge(:password_confirmation => "invalid")).
	        should_not be_valid
	    end
	
	    it "should reject short passwords" do
	      short = "a" * 5
	      hash = @attr.merge(:password => short, :password_confirmation => short)
	      User.new(hash).should_not be_valid
	    end
	
	    it "should reject long passwords" do
	      long = "a" * 41
	      hash = @attr.merge(:password => long, :password_confirmation => long)
	      User.new(hash).should_not be_valid
	    end
    end
    
    describe "password encryption" do
    	before(:each) do
    		@user = User.create!(@attr)
		end
		
		it "should have an encrypted password attribute" do
			@user.should respond_to(:encrypted_password)
		end

		it "should set the encrypted password attribute" do
			@user.encrypted_password.should_not be_blank
		end
		
		it "should have a salt" do
			@user.should respond_to(:salt)
		end		
		
	end
			
	describe "has_password? method" do
	  before(:each) do
	  	@user = User.create!(@attr)
	  end
		
	  it "should exist" do
	  	@user.should respond_to(:has_password?)
  	  end

      it "should be true if the passwords match" do
        @user.has_password?(@attr[:password]).should be_true
      end    

      it "should be false if the passwords don't match" do
        @user.has_password?("invalid").should be_false
      end     
	end
	
	describe "authenticate method" do
		it "should exist" do
			User.should respond_to(:authenticate)
		end
		
		it "should return nil on email/password mismatch" do
			User.authenticate(@attr[:email], "wrongpass").should be_nil
		end

		it "should return nil on for an email with no user" do
			User.authenticate("bar@foo.com", @attr[:password]).should be_nil
		end
		
		it "should return the user on a email/password match" do
			User.authenticate(@attr[:email], @attr[:password]).should == @user
		end
	end
end

# == Schema Information
#
# Table name: users
#
#  id                 :integer(4)      not null, primary key
#  name               :string(255)
#  email              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#

