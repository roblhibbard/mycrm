require 'test_helper'

class ClientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client = clients(:one)
  end

  test "should get index" do
    get clients_url
    assert_response :success
  end

  test "should get new" do
    get new_client_url
    assert_response :success
  end

  test "should create client" do
    assert_difference('Client.count') do
      post clients_url, params: { client: { address: @client.address, email: @client.email, first_name: @client.first_name, last_name: @client.last_name, phone_number: @client.phone_number, state: @client.state, zip_code: @client.zip_code } }
    end

    assert_redirected_to client_path(Client.last)
  end

  test "should show client" do
    get client_url(@client)
    assert_response :success
  end

  test "should get edit" do
    get edit_client_url(@client)
    assert_response :success
  end

  test "should update client" do
    patch client_url(@client), params: { client: { address: @client.address, email: @client.email, first_name: @client.first_name, last_name: @client.last_name, phone_number: @client.phone_number, state: @client.state, zip_code: @client.zip_code } }
    assert_redirected_to client_path(@client)
  end

  test "should destroy client" do
    assert_difference('Client.count', -1) do
      delete client_url(@client)
    end

    assert_redirected_to clients_path
  end
end
