require "rails_helper"

# feature "As an admin" do
#   before(:each) do
#     @user = create(:admin)
#   end

#   scenario "I can sign in to IdeaBoard" do
#     visit landing_path
#     click_link "Sign in"
#     fill_in "email", with: @user.email
#     fill_in "Password", with: @user.password
#     click_button "Sign in"

#     expect(page).to have_content(@user.email)
#   end

#   scenario "I can sign out of IdeaBoard" do
#     sign_in(@user)
#     visit root_path
#     click_link "Sign out"

#     expect(page).not_to have_content(@user.email)
#   end
# end

# feature "As a user" do
#   before(:each) do
#     @user = create(:user)
#   end

#   scenario "I can sign into IdeaBoard" do
#     visit landing_path
#     click_link "Sign in"
#     fill_in "email", with: @user.email
#     fill_in "Password", with: @user.password
#     click_button "Sign in"

#     expect(page).to have_content(@user.email)
#   end

#   scenario "I can sign out of IdeaBoard" do
#     sign_in(@user)
#     visit root_path
#     click_link "Sign out"

#     expect(page).not_to have_content(@user.email)
#   end
# end
