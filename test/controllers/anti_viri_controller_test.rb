require 'test_helper'

class AntiViriControllerTest < ActionController::TestCase
  setup do
    @client = clients(:one)
    @anti_virus = anti_viri(:one)
  end

  test "should get index" do
    get :index, params: { client_id: @client }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { client_id: @client }
    assert_response :success
  end

  test "should create anti_virus" do
    assert_difference('AntiVirus.count') do
      post :create, params: { client_id: @client, anti_virus: @anti_virus.attributes }
    end

    assert_redirected_to client_anti_virus_path(@client, AntiVirus.last)
  end

  test "should show anti_virus" do
    get :show, params: { client_id: @client, id: @anti_virus }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { client_id: @client, id: @anti_virus }
    assert_response :success
  end

  test "should update anti_virus" do
    put :update, params: { client_id: @client, id: @anti_virus, anti_virus: @anti_virus.attributes }
    assert_redirected_to client_anti_virus_path(@client, AntiVirus.last)
  end

  test "should destroy anti_virus" do
    assert_difference('AntiVirus.count', -1) do
      delete :destroy, params: { client_id: @client, id: @anti_virus }
    end

    assert_redirected_to client_anti_viri_path(@client)
  end
end
