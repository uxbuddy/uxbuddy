require 'rails_helper'

feature 'Tests' do
  context "welcome page" do

    let!(:test) { Test.create(name: 'Youtube', test_url: "https://www.youtube.com/embed/XGSy3_Czz8k") }

    scenario 'welcomes user to specific test page' do
      visit "/tests/#{test.id}"
      expect(page).to have_content("Thanks for participating in the test for Youtube")
    end
  end
end
