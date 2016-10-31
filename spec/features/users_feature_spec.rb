require 'rails_helper'

feature 'User authentication' do

  context 'Sign up' do

    scenario 'user can create an account with valid credentials', js: true do
      visit "/users/sign_up"
      expect{user_sign_up(email = 'test2@email.com')}.to change(User, :count).by(1)
      expect(page).to have_content "Welcome! You have signed up successfully."
    end

    scenario 'user cannot create account with invalid email' do
      visit "/users/sign_up"
      expect{user_sign_up(email = "not valid email")}.to change(User, :count).by(0)
    end

    scenario 'user cannot create account with non-unique email' do
      expect{user_sign_up}.to change(User, :count).by(0)
    end

    scenario 'user cannot create account with unmatching password confirmation' do
      visit "/users/sign_up"
      expect{user_sign_up(password_confirmation = "not matching password")}.to change(User, :count).by(0)
    end

    scenario 'user cannot create account without email' do
      visit "/users/sign_up"
      expect{user_sign_up(email = "")}.to change(User, :count).by(0)
    end

    scenario 'user cannot create account without password' do
      visit "/users/sign_up"
      expect{user_sign_up(password = "")}.to change(User, :count).by(0)
    end

  end

  context 'Sign in' do
    scenario 'valid user can sign in', js: true do
      user_sign_in
      expect(page).to have_content("Signed in successfully.")
    end
    scenario 'invalid user cannot sign in' do
      user_sign_in(password = "not my password")
      expect(page).not_to have_content("Signed in successfully.")
      expect(page).to have_current_path('/users/sign_in')
    end
  end

  context 'Sign out' do
    scenario 'user can sign out', js: true do
      user_sign_in
      user_sign_out
      expect(page).to have_content("Signed out successfully.")
    end
  end

end
