require 'rails_helper'

feature 'report page' do
  scenario 'report page loads' do
    visit '/tests/1/report'
    expect(page.status_code).to equal(200)
  end

  scenario 'report page has test name in header' do
    visit '/tests/1/report'
    expect(page).to have_content("Youtube // Test Report")
    within '#summary' do
      expect(page).to have_content("Test URL: https://www.youtube.com/embed/XGSy3_Czz8k")
      expect(page).to have_content("Number of questions: 3")
      expect(page).to have_content("Number of respondents: 5")
    end
  end

  scenario 'report page has a response average table' do
    visit '/tests/1/report'
    within '#response-averages' do
      expect(page).to have_content("Question number")
      expect(page).to have_content("Question")
      expect(page).to have_content("Average response")
    end
  end
end
