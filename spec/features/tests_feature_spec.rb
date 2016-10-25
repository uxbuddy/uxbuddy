require 'rails_helper'

feature 'Tests' do

  context "welcome page" do
    scenario 'welcomes user to specific test page' do
      Test.create(name: "Youtube", test_url: "https://www.youtube.com/embed/XGSy3_Czz8k")
      visit '/tests/1'
      expect(page).to have_content('Thanks for participating in name')
    end
  end
end
