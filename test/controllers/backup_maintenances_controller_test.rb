require 'test_helper'

class BackupMaintenancesControllerTest < ActionController::TestCase
  setup do
    @backup = backups(:one)
    @backup_maintenance = backup_maintenances(:one)
  end

  test "should get index" do
    get :index, params: { backup_id: @backup }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { backup_id: @backup }
    assert_response :success
  end

  test "should create backup_maintenance" do
    assert_difference('BackupMaintenance.count') do
      post :create, params: { backup_id: @backup, backup_maintenance: @backup_maintenance.attributes }
    end

    assert_redirected_to backup_backup_maintenance_path(@backup, BackupMaintenance.last)
  end

  test "should show backup_maintenance" do
    get :show, params: { backup_id: @backup, id: @backup_maintenance }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { backup_id: @backup, id: @backup_maintenance }
    assert_response :success
  end

  test "should update backup_maintenance" do
    put :update, params: { backup_id: @backup, id: @backup_maintenance, backup_maintenance: @backup_maintenance.attributes }
    assert_redirected_to backup_backup_maintenance_path(@backup, BackupMaintenance.last)
  end

  test "should destroy backup_maintenance" do
    assert_difference('BackupMaintenance.count', -1) do
      delete :destroy, params: { backup_id: @backup, id: @backup_maintenance }
    end

    assert_redirected_to backup_backup_maintenances_path(@backup)
  end
end
