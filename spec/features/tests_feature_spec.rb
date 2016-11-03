require 'rails_helper'

feature 'User can see a test' do

  before(:each) do
    Test.create(name: 'github', test_url: "https://github.com/lili2311/trelogan-yoga/blob/master/src/about.html", test_type_id: 1, slug: "github", question_ids: [1,3,5])
  end

  context "A test from a github link" do

    scenario 'iframe has correct source for github urls', js: true do
      visit "/tests/github"
      click_on('Start')
      expect(page).to have_xpath("//iframe[@src= 'https://htmlpreview.github.io/?https://github.com/lili2311/trelogan-yoga/blob/master/src/about.html']")
    end

  end

  context "User can complete a test of a github page" do

    scenario 'User can submit answers', js: true do
      visit "/tests/github"
      click_on('Start')
      fill_in 'comment1', with: 'This is so boss'
      click_link('Next')
      click_link('Next')
      click_link('Finish')
      counter = Test.last.questions.inject do |sum, x|
        sum + x.answers.where(test_id: Test.last.id).count
      end
      expect(counter).to eq(3)
      expect(page).to have_current_path("/tests/github/thanks")
      message = "Thank you for completing this test."
      expect(page).to have_content(message)
    end
  end

end
