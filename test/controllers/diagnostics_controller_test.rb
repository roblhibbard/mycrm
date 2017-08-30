require 'test_helper'

class DiagnosticsControllerTest < ActionController::TestCase
  setup do
    @ticket = tickets(:one)
    @diagnostic = diagnostics(:one)
  end

  test "should get index" do
    get :index, params: { ticket_id: @ticket }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { ticket_id: @ticket }
    assert_response :success
  end

  test "should create diagnostic" do
    assert_difference('Diagnostic.count') do
      post :create, params: { ticket_id: @ticket, diagnostic: @diagnostic.attributes }
    end

    assert_redirected_to ticket_diagnostic_path(@ticket, Diagnostic.last)
  end

  test "should show diagnostic" do
    get :show, params: { ticket_id: @ticket, id: @diagnostic }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { ticket_id: @ticket, id: @diagnostic }
    assert_response :success
  end

  test "should update diagnostic" do
    put :update, params: { ticket_id: @ticket, id: @diagnostic, diagnostic: @diagnostic.attributes }
    assert_redirected_to ticket_diagnostic_path(@ticket, Diagnostic.last)
  end

  test "should destroy diagnostic" do
    assert_difference('Diagnostic.count', -1) do
      delete :destroy, params: { ticket_id: @ticket, id: @diagnostic }
    end

    assert_redirected_to ticket_diagnostics_path(@ticket)
  end
end
