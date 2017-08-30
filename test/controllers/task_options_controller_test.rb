require 'test_helper'

class TaskOptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task_option = task_options(:one)
  end

  test "should get index" do
    get task_options_url
    assert_response :success
  end

  test "should get new" do
    get new_task_option_url
    assert_response :success
  end

  test "should create task_option" do
    assert_difference('TaskOption.count') do
      post task_options_url, params: { task_option: { option: @task_option.option } }
    end

    assert_redirected_to task_option_url(TaskOption.last)
  end

  test "should show task_option" do
    get task_option_url(@task_option)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_option_url(@task_option)
    assert_response :success
  end

  test "should update task_option" do
    patch task_option_url(@task_option), params: { task_option: { option: @task_option.option } }
    assert_redirected_to task_option_url(@task_option)
  end

  test "should destroy task_option" do
    assert_difference('TaskOption.count', -1) do
      delete task_option_url(@task_option)
    end

    assert_redirected_to task_options_url
  end
end
