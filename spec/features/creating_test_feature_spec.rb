require 'rails_helper'

feature 'User can create new tests' do

  scenario 'Homepage has link to get started' do
    visit '/'
    click_button 'Get started'
    expect(current_path).to eq('/tests/new')
  end

  scenario 'User can fill in a form to create a test' do
    create_test
    expect(page).to have_content("Share test for Asos Product Test")
    expect(page).to have_content("https://www.asos.com")
  end

  scenario 'User cannot submit a test without a valid URL' do
    create_test("myURL", "not_a_url")
    expect(page).to have_content("Test url is invalid")
  end

  scenario 'User cannot create two tests with the same name' do
    create_test("Climate", "http://www.climate.com")
    create_test("Climate", "http://www.climate.com")
    expect(page).to have_content("Name has already been taken")
  end

  scenario 'User can check multiple questions' do
    visit '/tests/new'
    fill_in 'test_name', with: "BBC Test"
    fill_in 'test_test_url', with: "http://www.bbc.co.uk"
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
