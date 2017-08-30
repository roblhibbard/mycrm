require 'test_helper'

class LabtechClientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @labtech_client = labtech_clients(:one)
  end

  test "should get index" do
    get labtech_clients_url
    assert_response :success
  end

  test "should get new" do
    get new_labtech_client_url
    assert_response :success
  end

  test "should create labtech_client" do
    assert_difference('LabtechClient.count') do
      post labtech_clients_url, params: { labtech_client: { company_name: @labtech_client.company_name, first_name: @labtech_client.first_name, last_name: @labtech_client.last_name } }
    end

    assert_redirected_to labtech_client_url(LabtechClient.last)
  end

  test "should show labtech_client" do
    get labtech_client_url(@labtech_client)
    assert_response :success
  end

  test "should get edit" do
    get edit_labtech_client_url(@labtech_client)
    assert_response :success
  end

  test "should update labtech_client" do
    patch labtech_client_url(@labtech_client), params: { labtech_client: { company_name: @labtech_client.company_name, first_name: @labtech_client.first_name, last_name: @labtech_client.last_name } }
    assert_redirected_to labtech_client_url(@labtech_client)
  end

  test "should destroy labtech_client" do
    assert_difference('LabtechClient.count', -1) do
      delete labtech_client_url(@labtech_client)
    end

    assert_redirected_to labtech_clients_url
  end
end
