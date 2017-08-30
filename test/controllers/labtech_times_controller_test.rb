require 'test_helper'

class LabtechTimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @labtech_time = labtech_times(:one)
  end

  test "should get index" do
    get labtech_times_url
    assert_response :success
  end

  test "should get new" do
    get new_labtech_time_url
    assert_response :success
  end

  test "should create labtech_time" do
    assert_difference('LabtechTime.count') do
      post labtech_times_url, params: { labtech_time: { date: @labtech_time.date, description: @labtech_time.description, done: @labtech_time.done, hours: @labtech_time.hours, labtech_client_id: @labtech_time.labtech_client_id, labticket_id: @labtech_time.labticket_id, mins: @labtech_time.mins, ticketid: @labtech_time.ticketid, timeslipid: @labtech_time.timeslipid, user_id: @labtech_time.user_id } }
    end

    assert_redirected_to labtech_time_url(LabtechTime.last)
  end

  test "should show labtech_time" do
    get labtech_time_url(@labtech_time)
    assert_response :success
  end

  test "should get edit" do
    get edit_labtech_time_url(@labtech_time)
    assert_response :success
  end

  test "should update labtech_time" do
    patch labtech_time_url(@labtech_time), params: { labtech_time: { date: @labtech_time.date, description: @labtech_time.description, done: @labtech_time.done, hours: @labtech_time.hours, labtech_client_id: @labtech_time.labtech_client_id, labticket_id: @labtech_time.labticket_id, mins: @labtech_time.mins, ticketid: @labtech_time.ticketid, timeslipid: @labtech_time.timeslipid, user_id: @labtech_time.user_id } }
    assert_redirected_to labtech_time_url(@labtech_time)
  end

  test "should destroy labtech_time" do
    assert_difference('LabtechTime.count', -1) do
      delete labtech_time_url(@labtech_time)
    end

    assert_redirected_to labtech_times_url
  end
end
