require 'rails_helper'

feature 'creating tests' do
  scenario 'homepage has link to get started' do
    visit '/'
    click_button 'Get started'
    expect(current_path).to eq('/tests/new')
  end

  scenario 'user can fill in a form to create a test' do
    visit '/tests/new'
    find(:css, "#q1").set("true")
    find(:css, "#q2").set("true")
    find(:css, "#q3").set("false")
    fill_in :test_url, with: "www.asos.com"
    click_button "Create Test"
    expect(page).to have_content("Share test for www.asos.com ")
  end

end
