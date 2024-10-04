require 'rails_helper'

describe "Creating an User", type: :feature do
  scenario "valid inputs" do
    visit new_user_registration_path

    fill_in "Email",	with: "john@doe.com"
    fill_in "Password",	with: "123456"
    fill_in "Password confirmation",	with: "123456"

    click_button "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario "don't create when email has already been taken" do
    User.create!(email: "john@doe.com", password: "password")
  
    visit new_user_registration_path

    fill_in "Email",  with: "john@doe.com"
    fill_in "Password",	with: "123456"
    fill_in "Password confirmation",	with: "123456"

    click_button "Sign up"

    expect(page).to have_content("Email has already been taken")
  end

  scenario "don't create when missing all fields" do
    visit new_user_registration_path

    click_button "Sign up"

    expect(page).to have_content("2 errors prohibited this user from being saved:")
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
  end

  scenario "don't create when missing passwords" do
    visit new_user_registration_path

    fill_in "Email",  with: "john@test.com"

    click_button "Sign up"

    expect(page).to have_content("Password can't be blank")
  end

  scenario "don't create when passwords doesn't match" do
    visit new_user_registration_path

    fill_in "Email",  with: "john@test.com"
    fill_in "Password",	with: "123456"
    fill_in "Password confirmation",	with: "654321"

    click_button "Sign up"

    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end