require 'rails_helper'

feature 'report page' do

  let!(:test) { Test.find(1) }
  let!(:question1) {test.questions[0]}
  let!(:answers) {question1.answers.where(test_id: test.id)}
  let!(:response1) {answers[0].response}
  let!(:response2) {answers[1].response}
  let!(:response3) {answers[2].response}
  let!(:average) {(response1 + response2 + response3)/3.0}

  scenario 'report page loads' do
    visit '/reports/1'
    expect(page.status_code).to equal(200)
  end

  scenario 'report page has test name in header' do
    visit '/reports/1'
    expect(page).to have_content("Youtube // Test Report")
    within '#summary' do
      expect(page).to have_content("Test URL: https://www.youtube.com/embed/XGSy3_Czz8k")
      expect(page).to have_content("Number of questions: 3")
      expect(page).to have_content("Number of respondents: 3")
    end
  end

  scenario 'report page has a response average table' do
    visit '/reports/1'
    within '#response-averages' do
      expect(page).to have_content("Question number")
      expect(page).to have_content("Question")
      expect(page).to have_content("Average response")
    end
  end

  scenario 'averages table displays average of question 1' do
    visit '/reports/1'
    within '#response-averages' do
      expect(page).to have_content(average.round(1))
    end
  end
end
