require 'rails_helper'

module FeatureHelpers
  def user_sign_up(email = "test@email.com", password = "password", password_confirmation = "password")
    visit '/users/sign_up'
    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password_confirmation
    click_button("Sign up")
  end

  def user_sign_out
    click_on("sign-out-1")
  end

  def user_sign_in(email = "test@email.com", password = "password")
    visit '/users/sign_in'
    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: password
    click_button("Log in")
  end

  def create_test(test_name = "Asos Product Test", test_url = "https://www.asos.com")
    visit '/'
    click_on "Get started"
    fill_in 'test_name', with: test_name
    fill_in 'test_test_url', with: test_url
    choose('Product page')
    check 'test_question_ids_1'
    click_button "Create Test"
  end
end
