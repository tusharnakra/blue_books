require 'test_helper'

class RequestAccessesControllerTest < ActionController::TestCase
  setup do
    @request_access = request_accesses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:request_accesses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create request_access" do
    assert_difference('RequestAccess.count') do
      post :create, request_access: { description: @request_access.description, subject: @request_access.subject }
    end

    assert_redirected_to request_access_path(assigns(:request_access))
  end

  test "should show request_access" do
    get :show, id: @request_access
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @request_access
    assert_response :success
  end

  test "should update request_access" do
    put :update, id: @request_access, request_access: { description: @request_access.description, subject: @request_access.subject }
    assert_redirected_to request_access_path(assigns(:request_access))
  end

  test "should destroy request_access" do
    assert_difference('RequestAccess.count', -1) do
      delete :destroy, id: @request_access
    end

    assert_redirected_to request_accesses_path
  end
end
