require "spec_helper"

feature "Log in into the system" do
  given(:user) {
    FactoryGirl.create(:user)
  }

  background do
    visit root_path
  end

  scenario "shows login page", js: true do
    expect(page).to have_content "Login"
  end

  scenario "login with a valid user", js: true do
    login(user.email, user.password)
    expect(page).to have_content "You are logged in."
  end

  scenario "try to login with password as password", js: true do
    login(user.email, "password")
    expect(page).to have_content "Something went wrong trying to log in."
  end

  scenario "try to login with an invalid user", js: true do
    login("invalid@email.com", "password")
    expect(page).to have_content "Something went wrong trying to log in."
  end

  scenario "logout", js: true do
    login(user.email, user.password)
    expect(page).to have_content "You are logged in."
    expect(page).to have_content "Supernatural"
    expect(page).to have_content "Drama"
    click_link "Logout"
    expect(page).to have_content "Logout with successfully."
  end



  def login(email, password)
    fill_in "user_email", with: email
    fill_in "user_password", with: password
    click_button "Login"
  end
end
