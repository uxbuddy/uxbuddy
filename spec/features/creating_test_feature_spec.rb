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
    select('Product', from: 'test_test_type')
    select('How would you rate the information available about the product?', from: 'test_questions')
    click_button "Create Test"
    expect(page).to have_content("Share test for Asos Product Test")
  end

end
