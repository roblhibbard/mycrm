require 'test_helper'

class LabticketsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @labticket = labtickets(:one)
  end

  test "should get index" do
    get labtickets_url
    assert_response :success
  end

  test "should get new" do
    get new_labticket_url
    assert_response :success
  end

  test "should create labticket" do
    assert_difference('Labticket.count') do
      post labtickets_url, params: { labticket: { subject: @labticket.subject } }
    end

    assert_redirected_to labticket_url(Labticket.last)
  end

  test "should show labticket" do
    get labticket_url(@labticket)
    assert_response :success
  end

  test "should get edit" do
    get edit_labticket_url(@labticket)
    assert_response :success
  end

  test "should update labticket" do
    patch labticket_url(@labticket), params: { labticket: { subject: @labticket.subject } }
    assert_redirected_to labticket_url(@labticket)
  end

  test "should destroy labticket" do
    assert_difference('Labticket.count', -1) do
      delete labticket_url(@labticket)
    end

    assert_redirected_to labtickets_url
  end
end
