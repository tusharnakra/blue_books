require 'test_helper'

class EmailGroupsControllerTest < ActionController::TestCase
  setup do
    @email_group = email_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:email_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create email_group" do
    assert_difference('EmailGroup.count') do
      post :create, email_group: { name: @email_group.name }
    end

    assert_redirected_to email_group_path(assigns(:email_group))
  end

  test "should show email_group" do
    get :show, id: @email_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @email_group
    assert_response :success
  end

  test "should update email_group" do
    put :update, id: @email_group, email_group: { name: @email_group.name }
    assert_redirected_to email_group_path(assigns(:email_group))
  end

  test "should destroy email_group" do
    assert_difference('EmailGroup.count', -1) do
      delete :destroy, id: @email_group
    end

    assert_redirected_to email_groups_path
  end
end
