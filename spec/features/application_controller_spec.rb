require 'rails_helper'
require 'capybara/rails'


describe ApplicationController do

  shared_examples_for 'user_signs_in' do
    given!(:user) { create(:user) }
    scenario 'with valid credentials' do
      visit new_user_session_path
      within("#new_user") do
        fill_in 'Email', :with => user.email
        fill_in 'Password', :with => user.password
      end
      click_button 'Log in'
      expect(page).to have_content 'index'
    end
  end

  feature 'user signs in', :type => :feature do
    it_behaves_like 'user_signs_in'
  end

  feature 'user signs out', :type => :feature do
    it_behaves_like 'user_signs_in'
    #後に実装
  end

end
