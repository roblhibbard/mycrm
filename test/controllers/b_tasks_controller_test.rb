require 'test_helper'

class BTasksControllerTest < ActionController::TestCase
  setup do
    @backup = backups(:one)
    @b_task = b_tasks(:one)
  end

  test "should get index" do
    get :index, params: { backup_id: @backup }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { backup_id: @backup }
    assert_response :success
  end

  test "should create b_task" do
    assert_difference('BTask.count') do
      post :create, params: { backup_id: @backup, b_task: @b_task.attributes }
    end

    assert_redirected_to backup_b_task_path(@backup, BTask.last)
  end

  test "should show b_task" do
    get :show, params: { backup_id: @backup, id: @b_task }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { backup_id: @backup, id: @b_task }
    assert_response :success
  end

  test "should update b_task" do
    put :update, params: { backup_id: @backup, id: @b_task, b_task: @b_task.attributes }
    assert_redirected_to backup_b_task_path(@backup, BTask.last)
  end

  test "should destroy b_task" do
    assert_difference('BTask.count', -1) do
      delete :destroy, params: { backup_id: @backup, id: @b_task }
    end

    assert_redirected_to backup_b_tasks_path(@backup)
  end
end
