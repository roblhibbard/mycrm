require 'test_helper'

class SystemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @system = systems(:one)
  end

  test "should get index" do
    get systems_url
    assert_response :success
  end

  test "should get new" do
    get new_system_url
    assert_response :success
  end

  test "should create system" do
    assert_difference('System.count') do
      post systems_url, params: { system: { client_id: @system.client_id, make: @system.make, model: @system.model, other_items: @system.other_items, serial_number: @system.serial_number, system_type: @system.system_type, ticket_id: @system.ticket_id, user_login: @system.user_login, user_password: @system.user_password } }
    end

    assert_redirected_to system_url(System.last)
  end

  test "should show system" do
    get system_url(@system)
    assert_response :success
  end

  test "should get edit" do
    get edit_system_url(@system)
    assert_response :success
  end

  test "should update system" do
    patch system_url(@system), params: { system: { client_id: @system.client_id, make: @system.make, model: @system.model, other_items: @system.other_items, serial_number: @system.serial_number, system_type: @system.system_type, ticket_id: @system.ticket_id, user_login: @system.user_login, user_password: @system.user_password } }
    assert_redirected_to system_url(@system)
  end

  test "should destroy system" do
    assert_difference('System.count', -1) do
      delete system_url(@system)
    end

    assert_redirected_to systems_url
  end
end
