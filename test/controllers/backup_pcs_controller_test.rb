require 'test_helper'

class BackupPcsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @backup_pc = backup_pcs(:one)
  end

  test "should get index" do
    get backup_pcs_url
    assert_response :success
  end

  test "should get new" do
    get new_backup_pc_url
    assert_response :success
  end

  test "should create backup_pc" do
    assert_difference('BackupPc.count') do
      post backup_pcs_url, params: { backup_pc: { active: @backup_pc.active, contract_service: @backup_pc.contract_service, labtech_client: @backup_pc.labtech_client, labtech_computer: @backup_pc.labtech_computer, labtech_computer: @backup_pc.labtech_computer, notes: @backup_pc.notes, service_list: @backup_pc.service_list, to: @backup_pc.to, to: @backup_pc.to, to: @backup_pc.to, to: @backup_pc.to, to: @backup_pc.to } }
    end

    assert_redirected_to backup_pc_url(BackupPc.last)
  end

  test "should show backup_pc" do
    get backup_pc_url(@backup_pc)
    assert_response :success
  end

  test "should get edit" do
    get edit_backup_pc_url(@backup_pc)
    assert_response :success
  end

  test "should update backup_pc" do
    patch backup_pc_url(@backup_pc), params: { backup_pc: { active: @backup_pc.active, contract_service: @backup_pc.contract_service, labtech_client: @backup_pc.labtech_client, labtech_computer: @backup_pc.labtech_computer, labtech_computer: @backup_pc.labtech_computer, notes: @backup_pc.notes, service_list: @backup_pc.service_list, to: @backup_pc.to, to: @backup_pc.to, to: @backup_pc.to, to: @backup_pc.to, to: @backup_pc.to } }
    assert_redirected_to backup_pc_url(@backup_pc)
  end

  test "should destroy backup_pc" do
    assert_difference('BackupPc.count', -1) do
      delete backup_pc_url(@backup_pc)
    end

    assert_redirected_to backup_pcs_url
  end
end
