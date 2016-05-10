require 'rails_helper'
require 'capybara/rails'

describe ApplicationController do
  feature 'user signs in', type: :feature do
    given!(:user) { create(:user) }
    scenario 'with valid credentials' do
      visit new_user_session_path
      within('#new_user') do
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
      end
      click_button 'Log in'
      expect(page).to have_content 'index'
    end
  end

  feature 'user signs out', type: :feature do
    given!(:user) { create(:user) }
    scenario 'with valid credentials' do
      visit new_user_session_path
      within('#new_user') do
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
      end
      click_button 'Log in'
      expect(page).to have_content 'index'
      click_link 'ログアウト'
      expect(page).to have_content 'Log in'
    end
  end
end
