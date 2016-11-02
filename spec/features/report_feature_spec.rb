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
    user_sign_in
    visit '/reports/1'
    expect(page.status_code).to equal(200)
  end

  scenario 'report page has test name in header' do
    user_sign_in
    visit '/reports/1'
    expect(page).to have_content("Youtube // Test Report")
    within '#summary' do
      expect(page).to have_content("Test URL: https://www.youtube.com/embed/XGSy3_Czz8k")
      expect(page).to have_content("Number of questions: 3")
      expect(page).to have_content("Number of respondents: 3")
      expect(page).to have_content("Percentage completion: 100%")
    end
  end

  scenario 'report page has an average chart' do
    user_sign_in
    visit '/reports/1'
    within '#report-chart' do
      expect(page.body).to have_content("How easy would you find it to buy these?")
    end
  end

  scenario 'average chart does not display if no reponses' do
    user_sign_in
    create_test("BBC", "http://www.bbc.co.uk")
    visit '/reports/5'
    within '#report-chart' do
      expect(page.body).to have_content("Sorry, no data yet!")
    end
  end


  scenario 'report page displays comments for each question' do
    user_sign_in
    visit '/reports/1'
    within '#question1-comments' do
      expect(page).to have_content('wow')
    end
  end

  scenario 'Nav bar chart icon links to tests#index' do
    user_sign_in
    visit '/'
    within '#nav' do
      find(:xpath, "//a[@id='tests-all-1']").click
      expect(page).to have_current_path("/tests")
    end
  end

  scenario 'User can only view reports page when signed in' do
    visit '/reports/1'
    expect(page).to have_current_path('/users/sign_in')
  end

  scenario 'reports index shows list of user test reports' do
    user_sign_in
    visit '/reports'
    expect(page).to have_current_path('/tests')
  end

end
