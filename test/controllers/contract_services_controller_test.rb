require 'test_helper'

class ContractServicesControllerTest < ActionController::TestCase
  setup do
    @client = clients(:one)
    @contract_service = contract_services(:one)
  end

  test "should get index" do
    get :index, params: { client_id: @client }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { client_id: @client }
    assert_response :success
  end

  test "should create contract_service" do
    assert_difference('ContractService.count') do
      post :create, params: { client_id: @client, contract_service: @contract_service.attributes }
    end

    assert_redirected_to client_contract_service_path(@client, ContractService.last)
  end

  test "should show contract_service" do
    get :show, params: { client_id: @client, id: @contract_service }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { client_id: @client, id: @contract_service }
    assert_response :success
  end

  test "should update contract_service" do
    put :update, params: { client_id: @client, id: @contract_service, contract_service: @contract_service.attributes }
    assert_redirected_to client_contract_service_path(@client, ContractService.last)
  end

  test "should destroy contract_service" do
    assert_difference('ContractService.count', -1) do
      delete :destroy, params: { client_id: @client, id: @contract_service }
    end

    assert_redirected_to client_contract_services_path(@client)
  end
end
