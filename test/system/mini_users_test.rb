require "application_system_test_case"

class MiniUsersTest < ApplicationSystemTestCase
  setup do
    @mini_user = mini_users(:one)
  end

  test "visiting the index" do
    visit mini_users_url
    assert_selector "h1", text: "Mini Users"
  end

  test "creating a Mini user" do
    visit mini_users_url
    click_on "New Mini User"

    fill_in "Avatar url", with: @mini_user.avatar_url
    fill_in "Country", with: @mini_user.country
    fill_in "Gender", with: @mini_user.gender
    fill_in "Nick name", with: @mini_user.nick_name
    fill_in "Open", with: @mini_user.open_id
    fill_in "Province", with: @mini_user.province
    fill_in "Unionid", with: @mini_user.unionid
    click_on "Create Mini user"

    assert_text "Mini user was successfully created"
    click_on "Back"
  end

  test "updating a Mini user" do
    visit mini_users_url
    click_on "Edit", match: :first

    fill_in "Avatar url", with: @mini_user.avatar_url
    fill_in "Country", with: @mini_user.country
    fill_in "Gender", with: @mini_user.gender
    fill_in "Nick name", with: @mini_user.nick_name
    fill_in "Open", with: @mini_user.open_id
    fill_in "Province", with: @mini_user.province
    fill_in "Unionid", with: @mini_user.unionid
    click_on "Update Mini user"

    assert_text "Mini user was successfully updated"
    click_on "Back"
  end

  test "destroying a Mini user" do
    visit mini_users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mini user was successfully destroyed"
  end
end
