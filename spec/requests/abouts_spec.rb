require 'spec_helper'

describe "About" do
  describe "GET /about" do
    it "should have the content 'Memoro'" do
      visit '/about'
      expect(page).to have_content('Memoro')
      expect(page).to have_content('Complementing your brain since 2013.')
    end
  end

end
