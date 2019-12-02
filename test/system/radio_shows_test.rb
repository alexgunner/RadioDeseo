require "application_system_test_case"

class RadioShowsTest < ApplicationSystemTestCase
  setup do
    @radio_show = radio_shows(:one)
  end

  test "visiting the index" do
    visit radio_shows_url
    assert_selector "h1", text: "Radio Shows"
  end

  test "creating a Radio show" do
    visit radio_shows_url
    click_on "New Radio Show"

    fill_in "Name", with: @radio_show.name
    click_on "Create Radio show"

    assert_text "Radio show was successfully created"
    click_on "Back"
  end

  test "updating a Radio show" do
    visit radio_shows_url
    click_on "Edit", match: :first

    fill_in "Name", with: @radio_show.name
    click_on "Update Radio show"

    assert_text "Radio show was successfully updated"
    click_on "Back"
  end

  test "destroying a Radio show" do
    visit radio_shows_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Radio show was successfully destroyed"
  end
end
