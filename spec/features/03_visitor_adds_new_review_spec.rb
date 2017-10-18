require 'rails_helper'

feature "visitor can add a new review" do
  scenario "visitor is logged in and adds a review successfully" do
    stowe = Mountain.create(name: 'Stowe', address: '5428 Mountain Road', city: 'Stowe',
    state: 'Vermont', zip: '02135')

    expect(page).to have_content "Sign Out"

    visit mountain_path(stowe)

    click_button "Add a review"

    expect(page).to have_content "Add a New Review"

    fill_in "Rating", with: 5
    fill_in "Review", with: "This is an amazing Mountain"
    click_button "Add Review"

    expect(page).to have_content 5
    expect(page).to have_content "This is an amazing Mountain"
  end

  scenario "visitor is logged in and unsuccessfuly submits review" do
    stowe = Mountain.create(name: 'Stowe', address: '5428 Mountain Road', city: 'Stowe',
    state: 'Vermont', zip: '02135')

    expect(page).to have_content "Sign Out"

    visit mountain_path(stowe)

    click_button "Add Review"

    expect(page).to have_content "Rating can't be blank"
  end

  scenario "visitor is not logged in and visits mountain show page" do
    expect(page).to have_content "Sign Up/Log In"

    click_button "Add Review"

    expect(page).to have_content "Looks like you're not logged in! If you want to add a new review, please sign up or log in!"
  end
end
