require 'rails_helper'

feature 'Tests' do
  context "welcome page" do

    scenario 'welcomes user to specific test page' do
      visit "/tests/1"
      expect(page).to have_content("Thanks for participating in the test for Youtube")
    end
  end
end
