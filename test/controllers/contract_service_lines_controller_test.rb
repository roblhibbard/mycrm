require 'test_helper'

class ContractServiceLinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contract_service_line = contract_service_lines(:one)
  end

  test "should get index" do
    get contract_service_lines_url
    assert_response :success
  end

  test "should get new" do
    get new_contract_service_line_url
    assert_response :success
  end

  test "should create contract_service_line" do
    assert_difference('ContractServiceLine.count') do
      post contract_service_lines_url, params: { contract_service_line: {  } }
    end

    assert_redirected_to contract_service_line_url(ContractServiceLine.last)
  end

  test "should show contract_service_line" do
    get contract_service_line_url(@contract_service_line)
    assert_response :success
  end

  test "should get edit" do
    get edit_contract_service_line_url(@contract_service_line)
    assert_response :success
  end

  test "should update contract_service_line" do
    patch contract_service_line_url(@contract_service_line), params: { contract_service_line: {  } }
    assert_redirected_to contract_service_line_url(@contract_service_line)
  end

  test "should destroy contract_service_line" do
    assert_difference('ContractServiceLine.count', -1) do
      delete contract_service_line_url(@contract_service_line)
    end

    assert_redirected_to contract_service_lines_url
  end
end
