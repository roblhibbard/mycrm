require 'test_helper'

class LabtechComputersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @labtech_computer = labtech_computers(:one)
  end

  test "should get index" do
    get labtech_computers_url
    assert_response :success
  end

  test "should get new" do
    get new_labtech_computer_url
    assert_response :success
  end

  test "should create labtech_computer" do
    assert_difference('LabtechComputer.count') do
      post labtech_computers_url, params: { labtech_computer: { computer: @labtech_computer.computer, domain: @labtech_computer.domain, labtech_client: @labtech_computer.labtech_client, labtech_location: @labtech_computer.labtech_location, name: @labtech_computer.name, os: @labtech_computer.os, username: @labtech_computer.username } }
    end

    assert_redirected_to labtech_computer_url(LabtechComputer.last)
  end

  test "should show labtech_computer" do
    get labtech_computer_url(@labtech_computer)
    assert_response :success
  end

  test "should get edit" do
    get edit_labtech_computer_url(@labtech_computer)
    assert_response :success
  end

  test "should update labtech_computer" do
    patch labtech_computer_url(@labtech_computer), params: { labtech_computer: { computer: @labtech_computer.computer, domain: @labtech_computer.domain, labtech_client: @labtech_computer.labtech_client, labtech_location: @labtech_computer.labtech_location, name: @labtech_computer.name, os: @labtech_computer.os, username: @labtech_computer.username } }
    assert_redirected_to labtech_computer_url(@labtech_computer)
  end

  test "should destroy labtech_computer" do
    assert_difference('LabtechComputer.count', -1) do
      delete labtech_computer_url(@labtech_computer)
    end

    assert_redirected_to labtech_computers_url
  end
end
