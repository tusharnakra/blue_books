require 'test_helper'

class SendDocumentsControllerTest < ActionController::TestCase
  setup do
    @send_document = send_documents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:send_documents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create send_document" do
    assert_difference('SendDocument.count') do
      post :create, send_document: { description: @send_document.description, subject: @send_document.subject }
    end

    assert_redirected_to send_document_path(assigns(:send_document))
  end

  test "should show send_document" do
    get :show, id: @send_document
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @send_document
    assert_response :success
  end

  test "should update send_document" do
    put :update, id: @send_document, send_document: { description: @send_document.description, subject: @send_document.subject }
    assert_redirected_to send_document_path(assigns(:send_document))
  end

  test "should destroy send_document" do
    assert_difference('SendDocument.count', -1) do
      delete :destroy, id: @send_document
    end

    assert_redirected_to send_documents_path
  end
end
