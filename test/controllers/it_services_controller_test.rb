require 'test_helper'

class ItServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @it_service = it_services(:one)
  end

  test "should get index" do
    get it_services_url
    assert_response :success
  end

  test "should get new" do
    get new_it_service_url
    assert_response :success
  end

  test "should create it_service" do
    assert_difference('ItService.count') do
      post it_services_url, params: { it_service: { active: @it_service.active, description: @it_service.description, name: @it_service.name, rate: @it_service.rate } }
    end

    assert_redirected_to it_service_url(ItService.last)
  end

  test "should show it_service" do
    get it_service_url(@it_service)
    assert_response :success
  end

  test "should get edit" do
    get edit_it_service_url(@it_service)
    assert_response :success
  end

  test "should update it_service" do
    patch it_service_url(@it_service), params: { it_service: { active: @it_service.active, description: @it_service.description, name: @it_service.name, rate: @it_service.rate } }
    assert_redirected_to it_service_url(@it_service)
  end

  test "should destroy it_service" do
    assert_difference('ItService.count', -1) do
      delete it_service_url(@it_service)
    end

    assert_redirected_to it_services_url
  end
end
