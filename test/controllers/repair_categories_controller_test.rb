require 'test_helper'

class RepairCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @repair_category = repair_categories(:one)
  end

  test "should get index" do
    get repair_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_repair_category_url
    assert_response :success
  end

  test "should create repair_category" do
    assert_difference('RepairCategory.count') do
      post repair_categories_url, params: { repair_category: { name: @repair_category.name } }
    end

    assert_redirected_to repair_category_url(RepairCategory.last)
  end

  test "should show repair_category" do
    get repair_category_url(@repair_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_repair_category_url(@repair_category)
    assert_response :success
  end

  test "should update repair_category" do
    patch repair_category_url(@repair_category), params: { repair_category: { name: @repair_category.name } }
    assert_redirected_to repair_category_url(@repair_category)
  end

  test "should destroy repair_category" do
    assert_difference('RepairCategory.count', -1) do
      delete repair_category_url(@repair_category)
    end

    assert_redirected_to repair_categories_url
  end
end
