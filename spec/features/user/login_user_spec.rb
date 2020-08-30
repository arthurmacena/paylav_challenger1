require "rails_helper"

RSpec.describe "Creating a new user", type: :feature, vcr: { cassette_name: "registration" } do
    feature "User login" do
      
      scenario "User with register" do
        visit new_user_session_path
        user = build(:user)
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_on "Log in"
      end

      scenario "User without register" do
        visit new_user_session_path
        fill_in "Email", with:  Faker::Internet.email 
        fill_in "Password", with:  Faker::Internet.password(min_length: 6) 
        click_on "Log in"
      end
    end
  end
  