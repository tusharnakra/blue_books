require 'test_helper'

class EmailAddressesControllerTest < ActionController::TestCase
  setup do
    @email_address = email_addresses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:email_addresses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create email_address" do
    assert_difference('EmailAddress.count') do
      post :create, email_address: { name: @email_address.name }
    end

    assert_redirected_to email_address_path(assigns(:email_address))
  end

  test "should show email_address" do
    get :show, id: @email_address
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @email_address
    assert_response :success
  end

  test "should update email_address" do
    put :update, id: @email_address, email_address: { name: @email_address.name }
    assert_redirected_to email_address_path(assigns(:email_address))
  end

  test "should destroy email_address" do
    assert_difference('EmailAddress.count', -1) do
      delete :destroy, id: @email_address
    end

    assert_redirected_to email_addresses_path
  end
end