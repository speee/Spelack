require 'rails_helper'
require 'capybara/rails'


describe ApplicationController do

  feature 'user signs in', :type => :feature, :js => true do
    let!(:user) { FactoryGirl.create(:user) }
    scenario 'with valid credentials' do
      visit new_user_session_path
      p user.email
      p user.password
      fill_in 'Email', :with => user.email
      fill_in 'Password', :with => user.password
      click_button 'Log in'
      expect(page).to have_content 'index'
    end
  end

end
