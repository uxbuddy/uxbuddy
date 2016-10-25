require 'rails_helper'

feature 'homepage' do
  scenario 'homepage has link to get started' do
    visit '/'
    click_button "Get started"
    expect(current_path).to eq('/tests/new')
  end

  # scenario 'can choose Product page in test choice' do
  #
  # end


end
