require "rails_helper"

RSpec.describe "Creating a new user", type: :feature, vcr: { cassette_name: "registration" } do
    feature "Sign in User" do
      
      scenario "Sign in with the correct fields" do
        visit new_user_registration_path
        fill_in "Email", with: Faker::Internet.email 
        senha = Faker::Internet.password(min_length: 6) 
        fill_in "Password", with: senha
        fill_in "Password confirmation", with: senha
        click_on "Sign up"
      end

      scenario "Sign in with different passwords" do
        visit new_user_registration_path
        fill_in "Email", with: Faker::Internet.email 
        fill_in "Password", with: Faker::Internet.password(min_length: 6) 
        fill_in "Password confirmation", with: Faker::Internet.password(min_length: 7) 
        click_on "Sign up"
        expect(page).to have_text("Password confirmation doesn't match Password")
      end
    end
  end
  