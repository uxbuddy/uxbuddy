require 'rails_helper'

feature 'Tests' do
  context "welcome page" do

    let!(:test) { Test.create(name: 'Youtube', test_url: "https://www.youtube.com/embed/XGSy3_Czz8k") }

    scenario 'user sees iframe url when starting test' do
      visit "/tests/show"
      expect(page).to have_content 'Welcome'
      expect(page).to have_xpath("//iframe[@src= 'https://www.youtube.com/embed/XGSy3_Czz8k']")
      expect(page).not_to have_xpath("//iframe[@src= 'other-url']")
    end
  end

  context "questions rendered" do

    let!(:test) { Test.create(name: 'Youtube', test_url: "https://www.youtube.com/embed/XGSy3_Czz8k") }

    # scenario 'user cannot initially see questions' do
    #   visit "/tests/show"
    #   expect(page).not_to have_content("Question 1")
    #   click_link('Next')
    #   expect(page).to have_content("Question 1")
    # end
  end
end
