require 'rails_helper'

feature 'User can see a test' do

  context "Welcome page" do
    let!(:test) { Test.find(1) }

    before(:each) do
      visit "/tests/youtube"
    end

    scenario 'user sees welcome page when they go to test url' do
      expect(page).to have_content 'Welcome'
    end

    scenario 'user sees iframe and question 1 when click Start button', js: true do
      click_button('Start')
      expect(page).to have_xpath("//iframe[@src= 'https://www.youtube.com/embed/XGSy3_Czz8k']")
      expect(page).not_to have_xpath("//iframe[@src= 'other-url']")
      expect(page).to have_content("How would you rate the information available about the product?")
    end
  end

  context "Questions rendered" do

    let!(:test) { Test.find(1) }

    scenario 'user cannot initially see questions', js: true do
      visit "/tests/1"
      click_button('Start')
      expect(page).not_to have_content("Question 2")
      click_link('Next')
      expect(page).to have_content("How easy would you find it to buy these?")
    end

  end

  context "User can visit friendly URL" do

    scenario 'User visits /tests/youtube and sees the right questions' do
      visit "/tests/youtube"
      expect(page.status_code).to equal(200)
      expect(page).to have_current_path("/tests/youtube")
    end

    scenario 'User can submit answers', js: true do
      visit "/tests/youtube"
      click_button('Start')
      find(:xpath, "//input[@id='range1']").set 2
      fill_in 'comment1', with: 'This is so boss'
      click_link('Next')
      expect{click_link('Next')}.to change(Answer, :count).by(1)
    end
  end

  context "Finishing a test" do

    let!(:test) { Test.find(1) }

    scenario 'User is redirected to a thank you page after completing questions', js: true do
      visit '/tests/youtube'
      click_button('Start')
      click_link('Next')
      click_link('Next')
      click_link('Finish')
      expect(page).to have_current_path("/tests/youtube/thanks")
      expect(page).to have_content('That\'s it!')
    end
  end
end
