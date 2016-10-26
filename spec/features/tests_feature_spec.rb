require 'rails_helper'

feature 'Tests' do
  context "welcome page" do

    let!(:test) { Test.create(name: 'Youtube', test_url: "https://www.youtube.com/embed/XGSy3_Czz8k") }

    before do
      visit "/tests/1" #need to change to actual test url
    end
    scenario 'user sees welcome page when they go to test url' do
      expect(page).to have_content 'Welcome'
    end
    xscenario 'user sees iframe and question 1 when click Start button' do
      click_button('Start')
      expect(page).to have_xpath("//iframe[@src= 'https://www.youtube.com/embed/XGSy3_Czz8k']")
      expect(page).not_to have_xpath("//iframe[@src= 'other-url']")
      expect(page).to have_content("How would you rate the information available about the product")
    end
  end

  context "questions rendered" do

    let!(:test) { Test.create(name: 'Youtube', test_url: "https://www.youtube.com/embed/XGSy3_Czz8k") }

    xscenario 'user cannot initially see questions' do
      visit "/tests/show"
      expect(page).not_to have_content("Question 2")
      click_link('Next')
      expect(page).to have_content("How easy would you find it to buy these?")
    end
  end


end
