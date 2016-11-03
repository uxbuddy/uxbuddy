require 'rails_helper'

feature 'User can see a test' do

  before(:each) do
    Test.create(name: 'youtube', test_url: "https://www.youtube.com/watch?v=Fz4F2X1xSc8", test_type_id: 1, slug: "youtube", question_ids: [1,3,5])
    Test.create(name: 'github', test_url: "https://github.com/lili2311/trelogan-yoga/blob/master/src/about.html", test_type_id: 1, slug: "github", question_ids: [1])
  end

  context "Github file tests" do

    scenario 'iframe has correct source for github urls', js: true do
      visit "/tests/github"
      click_on('Start')
      expect(page).to have_xpath("//iframe[@src= 'https://htmlpreview.github.io/?https://github.com/lili2311/trelogan-yoga/blob/master/src/about.html']")
    end

  end

  context "User can complete a test" do

    scenario 'User can submit answers', js: true do
      visit "/tests/youtube"
      click_on('Start')
      fill_in 'comment1', with: 'This is so boss'
      click_link('Next')
      click_link('Next')
      click_link('Finish')
      expect(Answer.count).to eq(3)
      expect(page).to have_current_path("/tests/youtube/thanks")
      message = "Thank you for completing this test."
      expect(page).to have_content(message)
    end
  end

  context 'Not signed in' do

    scenario 'User is redirected to sign up page if not signed in' do
      visit '/tests'
      expect(page).to have_current_path('/users/sign_up')
    end
   end

end
