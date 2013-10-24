require 'spec_helper'

describe User do
	before { @user = User.new(email: "user@example.com" ) }
	subject { @user }

	it { should respond_to(:email) }
	it { should respond_to(:password_digest) }
	it { should be_valid }

	describe "when email is not set" do
		before { @user.email = " " }
		it { should_not be_valid }
	end

	describe "when email is too long" do
		before { @user.email = "a" * 255 }
		it { should_not be_valid }
	end

	describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@host,com user_at_host.org example.user@host.com@host.com user@host+host.com]
      addresses.each do |invalid_address|
				@user.email = invalid_address
				expect(@user).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@host.COM A_US-ER@h.ost.org us.er@host.jp us+er@host.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end

  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
			user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

end
