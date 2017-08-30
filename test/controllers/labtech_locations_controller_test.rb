require 'test_helper'

class LabtechLocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @labtech_location = labtech_locations(:one)
  end

  test "should get index" do
    get labtech_locations_url
    assert_response :success
  end

  test "should get new" do
    get new_labtech_location_url
    assert_response :success
  end

  test "should create labtech_location" do
    assert_difference('LabtechLocation.count') do
      post labtech_locations_url, params: { labtech_location: { address: @labtech_location.address, city: @labtech_location.city, comments: @labtech_location.comments, fax: @labtech_location.fax, name: @labtech_location.name, phone: @labtech_location.phone, state: @labtech_location.state, zip: @labtech_location.zip } }
    end

    assert_redirected_to labtech_location_url(LabtechLocation.last)
  end

  test "should show labtech_location" do
    get labtech_location_url(@labtech_location)
    assert_response :success
  end

  test "should get edit" do
    get edit_labtech_location_url(@labtech_location)
    assert_response :success
  end

  test "should update labtech_location" do
    patch labtech_location_url(@labtech_location), params: { labtech_location: { address: @labtech_location.address, city: @labtech_location.city, comments: @labtech_location.comments, fax: @labtech_location.fax, name: @labtech_location.name, phone: @labtech_location.phone, state: @labtech_location.state, zip: @labtech_location.zip } }
    assert_redirected_to labtech_location_url(@labtech_location)
  end

  test "should destroy labtech_location" do
    assert_difference('LabtechLocation.count', -1) do
      delete labtech_location_url(@labtech_location)
    end

    assert_redirected_to labtech_locations_url
  end
end
