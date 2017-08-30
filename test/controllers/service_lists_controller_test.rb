require 'test_helper'

class ServiceListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @service_list = service_lists(:one)
  end

  test "should get index" do
    get service_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_service_list_url
    assert_response :success
  end

  test "should create service_list" do
    assert_difference('ServiceList.count') do
      post service_lists_url, params: { service_list: { 2year: @service_list.2year, antivirus: @service_list.antivirus, backup: @service_list.backup, charge: @service_list.charge, email: @service_list.email, hours: @service_list.hours, monthly: @service_list.monthly, office: @service_list.office, one_time: @service_list.one_time, reoccurrence: @service_list.reoccurrence, server: @service_list.server, workstation: @service_list.workstation, yearly: @service_list.yearly } }
    end

    assert_redirected_to service_list_url(ServiceList.last)
  end

  test "should show service_list" do
    get service_list_url(@service_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_service_list_url(@service_list)
    assert_response :success
  end

  test "should update service_list" do
    patch service_list_url(@service_list), params: { service_list: { 2year: @service_list.2year, antivirus: @service_list.antivirus, backup: @service_list.backup, charge: @service_list.charge, email: @service_list.email, hours: @service_list.hours, monthly: @service_list.monthly, office: @service_list.office, one_time: @service_list.one_time, reoccurrence: @service_list.reoccurrence, server: @service_list.server, workstation: @service_list.workstation, yearly: @service_list.yearly } }
    assert_redirected_to service_list_url(@service_list)
  end

  test "should destroy service_list" do
    assert_difference('ServiceList.count', -1) do
      delete service_list_url(@service_list)
    end

    assert_redirected_to service_lists_url
  end
end
