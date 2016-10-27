require 'rails_helper'

feature 'User can answer questions' do
  context 'Answer question 1' do
    let!(:test) { Test.find(1) }

    scenario 'clicking through to Submit answers', js: true do
      visit "/tests/1"
      click_button('Start')
      find(:xpath, "//input[@id='range']").set(3)
      expect{click_button('Submit')}.to change(Answer, :count).by(1)
    end
  end
end
