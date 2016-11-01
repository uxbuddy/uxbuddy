require 'rails_helper'

feature 'Guinea pigs can take tests:' do

  context "User clicks Start and is shown questions for that test" do

    before(:each) do
      user_sign_up
    end

    scenario 'non-Github-file test', js: true do
      create_test
      visit "/tests/asos"
      expect(page).to have_content 'Asos // Welcome'
      save_and_open_page
      click_on('Start')
      save_and_open_page
      expect(page).to have_xpath("//iframe[@src= 'http://www.asos.com/women/jumpers-cardigans/cat/?cid=2637&cr=6&CTARef=shop|knitwear']")
      expect(page).not_to have_xpath("//iframe[@src= 'other-url']")
      expect(page).to have_content("How would you rate the information available about the product?")
      expect(page).not_to have_content("How easy would you find it to buy these?")
      click_link('Next')
      expect(page).to have_content("How easy would you find it to buy these?")
    end

    scenario 'iframe has correct source for github urls', js: true do
      create_test(test_name = "Github", test_url= "https://github.com/lili2311/trelogan-yoga/blob/master/src/about.html")
      visit "/tests/github"
      click_on('Start')
      expect(page).to have_xpath("//iframe[@src= 'https://htmlpreview.github.io/?https://github.com/lili2311/trelogan-yoga/blob/master/src/about.html']")
      expect(page).to have_content("How would you rate the information available about the product?")
    end
  end


  context "Users can answer the questions", js: true do

    before(:each) do
      user_sign_up
      create_test
      visit "/tests/asos"
      click_on('Start')
    end

    scenario 'User can submit answers', js: true do
      find(:xpath, "//input[@id='range1']").set 1
      fill_in 'comment1', with: 'This is so boss'
      save_and_open_page
      click_link('Next')
      expect{click_link('Next')}.to change(Answer, :count).by(1)
      # expect answer.response for q1 to be 1
      # expect answer.comment for q1 to be "This is so boss"
    end

    scenario 'User is redirected to a thank you page after completing questions', js: true do
      click_link('Next')
      click_link('Finish')
      expect(page).to have_current_path("/tests/asos/thanks")
      message = "Thank you for completing this test."
      expect(page).to have_content(message)
    end
  end

end
