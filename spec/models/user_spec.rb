require 'spec_helper'

describe User do
	subject {User}
	before do
		@user = User.new({:name=>'Example user',:email=>'user@example.com', :password => "foobar", :password_confirmation => "foobar"})
	end

	it "should be valid" do
		@user.valid?.should be_true
	end

	it "should have a name attribute" do
		@user.name = "  "
		@user.valid?.should_not be_true
	end

	it "should have a name that isn't too long" do
		@user.name =  "a" * 51
		@user.valid?.should_not be_true
	end

	it "should have an email attribute" do
		@user.email = " "
		@user.valid?.should_not be_true
	end

	it "should have an email that isn't too long" do
		@user.email =  "a" * 244 + "@example.com"
		@user.valid?.should_not be_true
	end

	it "should have valid email address" do
		valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
		valid_addresses.each do |valid_address|
			@user.email = valid_address
			@user.valid?.should be_true
		end
	end

	it "should not have an invalid email address" do
		invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com foo@bar..com]
		invalid_addresses.each do |invalid_address|
			@user.email = invalid_address
			@user.valid?.should_not be_true
		end
	end

	it "should have a unique email" do
		duplicate_user = @user.dup
		duplicate_user.email = @user.email.upcase
		@user.save
		duplicate_user.valid?.should_not be_true
	end

	it "should have a pasword that isn't blank " do
		@user.password = @user.password_confirmation = " " * 6
		@user.valid?.should_not be_true
	end

	it "should have a password with a minimum length of 6" do
		@user.password = @user.password_confirmation = "a" * 3
		@user.valid?.should_not be_true
	end

end














































































