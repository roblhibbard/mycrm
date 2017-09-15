require 'test_helper'

class LabtechDispatchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @labtech_dispatch = labtech_dispatches(:one)
  end

  test "should get index" do
    get labtech_dispatches_url
    assert_response :success
  end

  test "should get new" do
    get new_labtech_dispatch_url
    assert_response :success
  end

  test "should create labtech_dispatch" do
    assert_difference('LabtechDispatch.count') do
      post labtech_dispatches_url, params: { labtech_dispatch: { phone: @labtech_dispatch.phone, subject: @labtech_dispatch.subject, timslip_category_id: @labtech_dispatch.timslip_category_id } }
    end

    assert_redirected_to labtech_dispatch_url(LabtechDispatch.last)
  end

  test "should show labtech_dispatch" do
    get labtech_dispatch_url(@labtech_dispatch)
    assert_response :success
  end

  test "should get edit" do
    get edit_labtech_dispatch_url(@labtech_dispatch)
    assert_response :success
  end

  test "should update labtech_dispatch" do
    patch labtech_dispatch_url(@labtech_dispatch), params: { labtech_dispatch: { phone: @labtech_dispatch.phone, subject: @labtech_dispatch.subject, timslip_category_id: @labtech_dispatch.timslip_category_id } }
    assert_redirected_to labtech_dispatch_url(@labtech_dispatch)
  end

  test "should destroy labtech_dispatch" do
    assert_difference('LabtechDispatch.count', -1) do
      delete labtech_dispatch_url(@labtech_dispatch)
    end

    assert_redirected_to labtech_dispatches_url
  end
end
