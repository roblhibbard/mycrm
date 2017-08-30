require 'test_helper'

class LabTicketStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lab_ticket_status = lab_ticket_statuses(:one)
  end

  test "should get index" do
    get lab_ticket_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_lab_ticket_status_url
    assert_response :success
  end

  test "should create lab_ticket_status" do
    assert_difference('LabTicketStatus.count') do
      post lab_ticket_statuses_url, params: { lab_ticket_status: { lab_status: @lab_ticket_status.lab_status, labticket_id: @lab_ticket_status.labticket_id, name: @lab_ticket_status.name } }
    end

    assert_redirected_to lab_ticket_status_url(LabTicketStatus.last)
  end

  test "should show lab_ticket_status" do
    get lab_ticket_status_url(@lab_ticket_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_lab_ticket_status_url(@lab_ticket_status)
    assert_response :success
  end

  test "should update lab_ticket_status" do
    patch lab_ticket_status_url(@lab_ticket_status), params: { lab_ticket_status: { lab_status: @lab_ticket_status.lab_status, labticket_id: @lab_ticket_status.labticket_id, name: @lab_ticket_status.name } }
    assert_redirected_to lab_ticket_status_url(@lab_ticket_status)
  end

  test "should destroy lab_ticket_status" do
    assert_difference('LabTicketStatus.count', -1) do
      delete lab_ticket_status_url(@lab_ticket_status)
    end

    assert_redirected_to lab_ticket_statuses_url
  end
end
