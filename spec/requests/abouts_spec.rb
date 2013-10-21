require 'spec_helper'

describe "GET About" do
  subject { page }
	before { visit about_path }

  it { should have_content('Memoro') }
	it { should have_content('Complementing your brain since 2013.') }
  it { should have_title('Memoro | About') }
end
