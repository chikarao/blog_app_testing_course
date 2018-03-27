require 'rails_helper'

RSpec.feature "Signup users" do
  scenario "with valid credentials" do
    visit "/"
    click_link "Sign up"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario "with invalid credentials" do
    visit "/"
    click_link "Sign up"
    fill_in "Email", with: ""
    fill_in "Password", with: ""
    fill_in "Password confirmation", with: ""
    click_button "Sign up"

    # expect(page).to have_content("You have not signed up successfully.")
  end
end
#signing up users
#visit root
#click on sign up
# email
# password
# password confirmation

# Invalid signup
# leave eamil and password empty
