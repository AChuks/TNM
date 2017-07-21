require 'rails_helper'

RSpec.describe User, type: :model do

	before(:each) do 
		@user = User.new(:user_name => 'Abraham', :email => 'abraham@r65labs.com',  :password => 'foobar', :password_confirmation => 'foobar' )
	end

	it 'should return a valid user model' do
		expect(@user.valid?).to eq(true);
	end

	it 'should have user_name attribute present' do 
		@user.user_name = '   '
		expect(@user.valid?).to eq(false)
	end

	it 'should have email attribute present' do 
		@user.email = '   '
		expect(@user.valid?).to eq(false)
	end

	it 'should have a user_name attribute that isn\'t too long' do
		@user.user_name = 'a'* 100
		expect(@user.valid?).to eq(false)
	end

	it 'should have an email attribute that isn\'t too long' do
		@user.email = 'a'* 101
		expect(@user.valid?).to eq(false)
	end

	it 'should accept valid email addresses' do
		email_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
        email_addresses.each do |address| 
        	@user.email = address
        	expect(@user.valid?).to eq(true)
        	"#{address} should be valid"
        end

	end 

	it 'should not accept invalid email addresses' do
		email_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
        email_addresses.each do |address| 
        	@user.email = address
        	expect(@user.valid?).to eq(false)
        	"#{address} should be invalid"
        end

	end 

	it 'should only accept unique email addresses' do
	 	duplicate_user = @user.dup
	 	@user.save
	 	expect(duplicate_user.valid?).to eq(false)
	end

	it 'should have a password attribute present' do 
		@user.password = ' '
		expect(@user.valid?).to eq(false)
	end

	it 'should have a password attribute that isn\'t too short' do 
		@user.password = 'a' * 3
		expect(@user.valid?).to eq(false)
	end

end
