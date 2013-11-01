require 'spec_helper'


describe "Authentication" do

	subject { page }

  describe "signin" do
		before { visit root_path }

		
		it { should have_content('New user?') }
		it { should have_link('Sign up now!', href: signup_path) }
    it { should have_title('Home') }

		describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Sign in"
      end

      it { should have_title(user.email) }
      it { should have_link('Sign out',    href: signout_path) }
      it { should_not have_link('Sign in', href: root_path) }
    end

		describe "with invalid information" do
			before { click_button "Sign in" }

			it { should have_title "Home" }
      it { should have_selector('div.alert.alert-error', text: 'Invalid') }
		end
  end
end
