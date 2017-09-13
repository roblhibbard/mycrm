require 'test_helper'

class TimeslipCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @timeslip_category = timeslip_categories(:one)
  end

  test "should get index" do
    get timeslip_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_timeslip_category_url
    assert_response :success
  end

  test "should create timeslip_category" do
    assert_difference('TimeslipCategory.count') do
      post timeslip_categories_url, params: { timeslip_category: { labtech_timeslip_id: @timeslip_category.labtech_timeslip_id, labtime: @timeslip_category.labtime, name: @timeslip_category.name } }
    end

    assert_redirected_to timeslip_category_url(TimeslipCategory.last)
  end

  test "should show timeslip_category" do
    get timeslip_category_url(@timeslip_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_timeslip_category_url(@timeslip_category)
    assert_response :success
  end

  test "should update timeslip_category" do
    patch timeslip_category_url(@timeslip_category), params: { timeslip_category: { labtech_timeslip_id: @timeslip_category.labtech_timeslip_id, labtime: @timeslip_category.labtime, name: @timeslip_category.name } }
    assert_redirected_to timeslip_category_url(@timeslip_category)
  end

  test "should destroy timeslip_category" do
    assert_difference('TimeslipCategory.count', -1) do
      delete timeslip_category_url(@timeslip_category)
    end

    assert_redirected_to timeslip_categories_url
  end
end
