require "rails_helper"

feature "As an admin" do
  before(:each) do
    @user = create(:admin)
  end

  scenario "I can sign in to IdeaBoard" do
    visit landing_path
    click_link "Sign in"
    fill_in "Username", with: @user.username
    fill_in "Password", with: @user.password_digest
    click_button "Sign in"

    expect(page).to have_content(@user.username)
  end

  scenario "I can sign out of IdeaBoard" do
    sign_in(@user)
    visit root_path
    click_link "Sign out"

    expect(page).not_to have_content(@user.username)
  end
end
