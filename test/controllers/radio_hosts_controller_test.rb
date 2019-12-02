require 'test_helper'

class RadioHostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @radio_host = radio_hosts(:one)
  end

  test "should get index" do
    get radio_hosts_url
    assert_response :success
  end

  test "should get new" do
    get new_radio_host_url
    assert_response :success
  end

  test "should create radio_host" do
    assert_difference('RadioHost.count') do
      post radio_hosts_url, params: { radio_host: { name: @radio_host.name } }
    end

    assert_redirected_to radio_host_url(RadioHost.last)
  end

  test "should show radio_host" do
    get radio_host_url(@radio_host)
    assert_response :success
  end

  test "should get edit" do
    get edit_radio_host_url(@radio_host)
    assert_response :success
  end

  test "should update radio_host" do
    patch radio_host_url(@radio_host), params: { radio_host: { name: @radio_host.name } }
    assert_redirected_to radio_host_url(@radio_host)
  end

  test "should destroy radio_host" do
    assert_difference('RadioHost.count', -1) do
      delete radio_host_url(@radio_host)
    end

    assert_redirected_to radio_hosts_url
  end
end
