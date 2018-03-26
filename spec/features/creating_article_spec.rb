require 'rails_helper'

RSpec.feature "Creating Article" do
  scenario "A user creates a new article" do
    visit "/"
    #visit root/ go to root page
    click_link "New Article"
    # make the name what you creates
    fill_in "Title", with: "Creating a blog"
    #capybara will fill in for you in the field
    fill_in "Body", with: "Lorem Ipsum"

    click_button "Create Article"

    expect(page).to have_content("Article has been created")
    expect(page.current_path).to eq(articles_path)
  end
end
