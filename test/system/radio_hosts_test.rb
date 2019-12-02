require "application_system_test_case"

class RadioHostsTest < ApplicationSystemTestCase
  setup do
    @radio_host = radio_hosts(:one)
  end

  test "visiting the index" do
    visit radio_hosts_url
    assert_selector "h1", text: "Radio Hosts"
  end

  test "creating a Radio host" do
    visit radio_hosts_url
    click_on "New Radio Host"

    fill_in "Name", with: @radio_host.name
    click_on "Create Radio host"

    assert_text "Radio host was successfully created"
    click_on "Back"
  end

  test "updating a Radio host" do
    visit radio_hosts_url
    click_on "Edit", match: :first

    fill_in "Name", with: @radio_host.name
    click_on "Update Radio host"

    assert_text "Radio host was successfully updated"
    click_on "Back"
  end

  test "destroying a Radio host" do
    visit radio_hosts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Radio host was successfully destroyed"
  end
end
