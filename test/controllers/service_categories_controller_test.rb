require 'test_helper'

class ServiceCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @service_category = service_categories(:one)
  end

  test "should get index" do
    get service_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_service_category_url
    assert_response :success
  end

  test "should create service_category" do
    assert_difference('ServiceCategorie.count') do
      post service_categories_url, params: { service_category: { name: @service_category.name, sub_category_id: @service_category.sub_category_id } }
    end

    assert_redirected_to service_category_url(ServiceCategorie.last)
  end

  test "should show service_category" do
    get service_category_url(@service_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_service_category_url(@service_category)
    assert_response :success
  end

  test "should update service_category" do
    patch service_category_url(@service_category), params: { service_category: { name: @service_category.name, sub_category_id: @service_category.sub_category_id } }
    assert_redirected_to service_category_url(@service_category)
  end

  test "should destroy service_category" do
    assert_difference('ServiceCategorie.count', -1) do
      delete service_category_url(@service_category)
    end

    assert_redirected_to service_categories_url
  end
end
