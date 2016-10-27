require 'rails_helper'

feature 'creating tests' do

  scenario 'homepage has link to get started' do
    visit '/'
    click_button 'Get started'
    expect(current_path).to eq('/tests/new')
  end

  scenario 'user can fill in a form to create a test' do
    visit '/tests/new'
    fill_in 'test_name', with: "Asos Product Test"
    fill_in 'test_test_url', with: "www.asos.com"
    select('Product', from: 'test_test_type_id')
    check 'test_question_ids_1'
    click_button "Create Test"
    expect(page).to have_content("Share test for Asos Product Test")
  end

  scenario 'user can check multiple questions' do
    visit '/tests/new'
    fill_in 'test_name', with: "Asos Product Test"
    fill_in 'test_test_url', with: "www.asos.com"
    select('Product', from: 'test_test_type_id')
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
