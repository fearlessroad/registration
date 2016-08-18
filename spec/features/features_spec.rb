require "rails_helper"
describe "Register" do
  it "prompts for the user fields" do
    visit "/"
    expect(page).to have_field('first_name')
    expect(page).to have_field('last_name')
    expect(page).to have_field('email')
    expect(page).to have_field('password')
    expect(page).to have_field('password_confirmation')
  end
  it "creates user and redirects to user's page" do
    visit "/"
    fill_in "first_name", with: "Luke"
    fill_in "last_name", with: "Skywalker"
    fill_in "email", with: "sky@walker.com"
    fill_in "password", with: "forceawakened"
    fill_in "password_confirmation", with: "forceawakened"
    click_button "Register"
    user = User.last
    expect(current_path).to eq("/users/#{user.id}")
    expect(page).to have_text("Luke Skywalker")
  end
end
