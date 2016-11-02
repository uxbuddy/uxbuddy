require 'rails_helper'

feature 'User can see a test' do

  context "Welcome page" do
    let!(:test) { Test.find(1) }

    before(:each) do
      visit "/tests/youtube"
    end

  end

  context "Github file tests" do

    scenario 'iframe has correct source for github urls', js: true do
      visit "/tests/githubtest"
      click_on('Start')
      expect(page).to have_xpath("//iframe[@src= 'https://htmlpreview.github.io/?https://github.com/lili2311/trelogan-yoga/blob/master/src/about.html']")
    end
  end

  context "User can complete a test" do

    scenario 'User can submit answers', js: true do
      visit "/tests/youtube"
      click_on('Start')
      within '.range-label' do
        find(:xpath, "//span[text()]").set 1
      end
      fill_in 'comment1', with: 'This is so boss'
      click_link('Next')
      click_link('Next')
      click_link('Finish')
      expect{click_link('Next')}.to change(Answer, :count).by(1)
      expect(page).to have_current_path("/tests/youtube/thanks")
      message = "Thank you for completing this test."
      expect(page).to have_content(message)
    end
  end

  context "Finishing a test" do

    let!(:test) { Test.find(1) }

    scenario 'User is redirected to a thank you page after completing questions', js: true do
      visit '/tests/youtube'
      click_on('Start')
      click_link('Next')



    end
  end

  context 'Not signed in' do

    scenario 'User is redirected to sign up page if not signed in' do
      visit '/tests'
      expect(page).to have_current_path('/users/sign_up')
    end
   end

end
