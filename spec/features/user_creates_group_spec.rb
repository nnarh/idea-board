require "rails_helper"

feature "user creates new group" do
  scenario "successfully" do
    visit groups_path

    expect(page).to have_css "h3", text: "Your Groups"

    click_on "Create New Group"

    visit new_group_path

    fill_in "Name", with: "Ruby"
    fill_in "Description", with: "Cool Ruby Group"
    click_on "Create Group"

    visit groups_path

    expect(page).to have_css ".groups li", text: "Ruby"
  end
end
