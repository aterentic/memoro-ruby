require 'spec_helper'

describe "About" do
  describe "GET" do
    it "should have the content 'Memoro'" do
      visit '/about'
      expect(page).to have_content('Memoro')
    end
  end

  describe "GET" do
		it "should have the content 'Complementing your brain since 2013.'" do
      visit '/about'
      expect(page).to have_content('Complementing your brain since 2013.')
    end
  end

  describe "GET" do
    it "should have title 'Memoro | About'" do
      visit '/about'
      expect(page).to have_title('Memoro | About')
    end
  end
end
