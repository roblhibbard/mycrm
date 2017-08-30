require 'test_helper'

class LabtechAuditsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @labtech_audit = labtech_audits(:one)
  end

  test "should get index" do
    get labtech_audits_url
    assert_response :success
  end

  test "should get new" do
    get new_labtech_audit_url
    assert_response :success
  end

  test "should create labtech_audit" do
    assert_difference('LabtechAudit.count') do
      post labtech_audits_url, params: { labtech_audit: { cal_ticket: @labtech_audit.cal_ticket, cal_time: @labtech_audit.cal_time, category: @labtech_audit.category, complete: @labtech_audit.complete, date: @labtech_audit.date, description: @labtech_audit.description, details: @labtech_audit.details, labtech_ticket: @labtech_audit.labtech_ticket, technician: @labtech_audit.technician, time: @labtech_audit.time, time_dif: @labtech_audit.time_dif, upadted: @labtech_audit.upadted } }
    end

    assert_redirected_to labtech_audit_url(LabtechAudit.last)
  end

  test "should show labtech_audit" do
    get labtech_audit_url(@labtech_audit)
    assert_response :success
  end

  test "should get edit" do
    get edit_labtech_audit_url(@labtech_audit)
    assert_response :success
  end

  test "should update labtech_audit" do
    patch labtech_audit_url(@labtech_audit), params: { labtech_audit: { cal_ticket: @labtech_audit.cal_ticket, cal_time: @labtech_audit.cal_time, category: @labtech_audit.category, complete: @labtech_audit.complete, date: @labtech_audit.date, description: @labtech_audit.description, details: @labtech_audit.details, labtech_ticket: @labtech_audit.labtech_ticket, technician: @labtech_audit.technician, time: @labtech_audit.time, time_dif: @labtech_audit.time_dif, upadted: @labtech_audit.upadted } }
    assert_redirected_to labtech_audit_url(@labtech_audit)
  end

  test "should destroy labtech_audit" do
    assert_difference('LabtechAudit.count', -1) do
      delete labtech_audit_url(@labtech_audit)
    end

    assert_redirected_to labtech_audits_url
  end
end
