require "rails_helper"

feature "user visits homepage" do
  scenario "successfully" do
    visit "/"

    expect(page).to have_css "li a", "text": "Home"
  end
end
