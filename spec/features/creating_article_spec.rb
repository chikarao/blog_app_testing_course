require 'rails_helper'

RSpec.feature "Creating Article" do
  before do
    @john = User.create!(email: "john@example.com", password: "password")
    login_as(@john)
  end

  scenario "A user creates a new article" do
      # Article.delete_all
    visit "/"
    #visit root/ go to root page
    click_link "New Article"
    # make the name what you creates
    fill_in "Title", with: "Creating a blog"
    #capybara will fill in for you in the field
    fill_in "Body", with: "Lorem Ipsum"

    click_button "Create Article"

    expect(Article.last.user).to eq(@john)
    expect(page).to have_content("Article has been created")
    expect(page.current_path).to eq(articles_path)
    expect(page).to have_content("Created by: #{@john.email}")
  end

# Test validation
  scenario "A user fails to create a new article" do
    visit "/"
    #visit root/ go to root page
    click_link "New Article"
    # make the name what you creates
    fill_in "Title", with: ""
    #capybara will fill in for you in the field
    fill_in "Body", with: ""

    click_button "Create Article"

    #same until here as above expectation changes
    expect(page).to have_content("Article has not been created")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")

  end
end
