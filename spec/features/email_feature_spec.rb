require 'rails_helper'

feature 'Emailing tests' do

  let!(:user) { User.create(email: 'example@user.com', password: 'password')}

  before do
    user_sign_in('example@user.com', 'password')
    create_test('emailtest', 'http://www.bbc.co.uk/news')
  end

  scenario 'sharing test link' do
    visit '/tests/emailtest/share'
    fill_in('emails_emails', with: 'first@person.com, second@person.com')
    expect { click_button('Send') }.to change { ActionMailer::Base.deliveries.count }.by(1)
    expect(page.body).to have_content("Emails sent. Check back soon for results.")
  end
end
