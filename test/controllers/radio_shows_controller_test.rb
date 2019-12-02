require 'test_helper'

class RadioShowsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @radio_show = radio_shows(:one)
  end

  test "should get index" do
    get radio_shows_url
    assert_response :success
  end

  test "should get new" do
    get new_radio_show_url
    assert_response :success
  end

  test "should create radio_show" do
    assert_difference('RadioShow.count') do
      post radio_shows_url, params: { radio_show: { name: @radio_show.name } }
    end

    assert_redirected_to radio_show_url(RadioShow.last)
  end

  test "should show radio_show" do
    get radio_show_url(@radio_show)
    assert_response :success
  end

  test "should get edit" do
    get edit_radio_show_url(@radio_show)
    assert_response :success
  end

  test "should update radio_show" do
    patch radio_show_url(@radio_show), params: { radio_show: { name: @radio_show.name } }
    assert_redirected_to radio_show_url(@radio_show)
  end

  test "should destroy radio_show" do
    assert_difference('RadioShow.count', -1) do
      delete radio_show_url(@radio_show)
    end

    assert_redirected_to radio_shows_url
  end
end
