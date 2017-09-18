require 'test_helper'

class LabDispatchesControllerTest < ActionController::TestCase
  setup do
    @labticket = labtickets(:one)
    @lab_dispatch = lab_dispatches(:one)
  end

  test "should get index" do
    get :index, params: { labticket_id: @labticket }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { labticket_id: @labticket }
    assert_response :success
  end

  test "should create lab_dispatch" do
    assert_difference('LabDispatch.count') do
      post :create, params: { labticket_id: @labticket, lab_dispatch: @lab_dispatch.attributes }
    end

    assert_redirected_to labticket_lab_dispatch_path(@labticket, LabDispatch.last)
  end

  test "should show lab_dispatch" do
    get :show, params: { labticket_id: @labticket, id: @lab_dispatch }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { labticket_id: @labticket, id: @lab_dispatch }
    assert_response :success
  end

  test "should update lab_dispatch" do
    put :update, params: { labticket_id: @labticket, id: @lab_dispatch, lab_dispatch: @lab_dispatch.attributes }
    assert_redirected_to labticket_lab_dispatch_path(@labticket, LabDispatch.last)
  end

  test "should destroy lab_dispatch" do
    assert_difference('LabDispatch.count', -1) do
      delete :destroy, params: { labticket_id: @labticket, id: @lab_dispatch }
    end

    assert_redirected_to labticket_lab_dispatches_path(@labticket)
  end
end
