require 'rails_helper'

feature 'Tests' do
  context "welcome page" do

    let!(:test) { Test.create(name: 'Youtube', test_url: "https://www.youtube.com/embed/XGSy3_Czz8k") }

    before do
      visit "/tests/show" #need to change to actual test url
    end
    scenario 'user sees welcome page when they go to test url' do
      expect(page).to have_content 'Welcome'
    end
    scenario 'user sees iframe and question 1 when click Start button' do
      click_button('Start')
      expect(page).to have_xpath("//iframe[@src= 'https://www.youtube.com/embed/XGSy3_Czz8k']")
      expect(page).not_to have_xpath("//iframe[@src= 'other-url']")
      expect(page).to have_content("Question 1")
    end
  end

  context "questions rendered" do

    let!(:test) { Test.create(name: 'Youtube', test_url: "https://www.youtube.com/embed/XGSy3_Czz8k") }

    scenario 'user cannot initially see questions' do
      visit "/tests/show"
      expect(page).not_to have_content("Question 2")
      click_link('Next')
      expect(page).to have_content("Question 2")
    end
  end
end
