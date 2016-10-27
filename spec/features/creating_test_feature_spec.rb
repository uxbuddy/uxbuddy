require 'rails_helper'

feature 'User can create new tests' do

  scenario 'Homepage has link to get started' do
    visit '/'
    click_button 'Get started'
    expect(current_path).to eq('/tests/new')
  end

  scenario 'User can fill in a form to create a test' do
    start_creating_test
    check 'test_question_ids_1'
    click_button "Create Test"
    expect(page).to have_content("Share test for Asos Product Test")
    expect(page).to have_content("https://www.asos.com")
  end

  scenario 'User can check multiple questions' do
    start_creating_test
    check 'test_question_ids_1'
    check 'test_question_ids_2'
    question1 = find('#test_question_ids_1')
    question2 = find('#test_question_ids_2')
    question3 = find('#test_question_ids_3')
    expect(question1).to be_checked
    expect(question2).to be_checked
    expect(question3).to_not be_checked
  end

end
