require 'test_helper'

class LabtechClientOtherDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @labtech_client_other_datum = labtech_client_other_data(:one)
  end

  test "should get index" do
    get labtech_client_other_data_url
    assert_response :success
  end

  test "should get new" do
    get new_labtech_client_other_datum_url
    assert_response :success
  end

  test "should create labtech_client_other_datum" do
    assert_difference('LabtechClientOtherDatum.count') do
      post labtech_client_other_data_url, params: { labtech_client_other_datum: { contract_rep: @labtech_client_other_datum.contract_rep, labtech_client_id: @labtech_client_other_datum.labtech_client_id, lclient_id: @labtech_client_other_datum.lclient_id, monthly_billable_time: @labtech_client_other_datum.monthly_billable_time, monthly_emergency_time: @labtech_client_other_datum.monthly_emergency_time, monthly_non_billable_time: @labtech_client_other_datum.monthly_non_billable_time, name: @labtech_client_other_datum.name, servers_under_contract: @labtech_client_other_datum.servers_under_contract, workstations_under_contract: @labtech_client_other_datum.workstations_under_contract } }
    end

    assert_redirected_to labtech_client_other_datum_url(LabtechClientOtherDatum.last)
  end

  test "should show labtech_client_other_datum" do
    get labtech_client_other_datum_url(@labtech_client_other_datum)
    assert_response :success
  end

  test "should get edit" do
    get edit_labtech_client_other_datum_url(@labtech_client_other_datum)
    assert_response :success
  end

  test "should update labtech_client_other_datum" do
    patch labtech_client_other_datum_url(@labtech_client_other_datum), params: { labtech_client_other_datum: { contract_rep: @labtech_client_other_datum.contract_rep, labtech_client_id: @labtech_client_other_datum.labtech_client_id, lclient_id: @labtech_client_other_datum.lclient_id, monthly_billable_time: @labtech_client_other_datum.monthly_billable_time, monthly_emergency_time: @labtech_client_other_datum.monthly_emergency_time, monthly_non_billable_time: @labtech_client_other_datum.monthly_non_billable_time, name: @labtech_client_other_datum.name, servers_under_contract: @labtech_client_other_datum.servers_under_contract, workstations_under_contract: @labtech_client_other_datum.workstations_under_contract } }
    assert_redirected_to labtech_client_other_datum_url(@labtech_client_other_datum)
  end

  test "should destroy labtech_client_other_datum" do
    assert_difference('LabtechClientOtherDatum.count', -1) do
      delete labtech_client_other_datum_url(@labtech_client_other_datum)
    end

    assert_redirected_to labtech_client_other_data_url
  end
end
