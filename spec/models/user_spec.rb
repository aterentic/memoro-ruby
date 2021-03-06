require 'spec_helper'

describe User do
	before { @user = User.new(email: "user@example.com", password: "password", password_confirmation: "password" ) }
	subject { @user }

	it { should respond_to(:email) }
	it { should respond_to(:password_digest) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:remember_token) }
	it { should respond_to(:authenticate) }
	it { should be_valid }

	describe "when password is not present" do
		before { @user = User.new(email: "user@example.com", password: "", password_confirmation: "") }
		it { should_not be_valid }
	end

	describe "when password and confirmation does not match" do
		before { @user.password_confirmation = "drowssap" }
		it { should_not be_valid }
	end

  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

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

	describe "return value of authenticate method" do
	  before { @user.save }
		let(:found_user) { User.find_by(email: @user.email) }

	  describe "with valid password" do
	    it { should eq found_user.authenticate(@user.password) }
		end

	  describe "with invalid password" do
			let(:user_for_invalid_password) { found_user.authenticate("invalid") }

		  it { should_not eq user_for_invalid_password }
	    specify { expect(user_for_invalid_password).to be_false }
		end

	  describe "remember token" do
		  before { @user.save }
	    its(:remember_token) { should_not be_blank }
	  end
	end
end
