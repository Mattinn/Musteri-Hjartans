require 'test_helper'

class WebstoresControllerTest < ActionController::TestCase
  setup do
    @webstore = webstores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:webstores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create webstore" do
    assert_difference('Webstore.count') do
      post :create, webstore: { address: @webstore.address, description: @webstore.description, link: @webstore.link, phone: @webstore.phone, title: @webstore.title }
    end

    assert_redirected_to webstore_path(assigns(:webstore))
  end

  test "should show webstore" do
    get :show, id: @webstore
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @webstore
    assert_response :success
  end

  test "should update webstore" do
    put :update, id: @webstore, webstore: { address: @webstore.address, description: @webstore.description, link: @webstore.link, phone: @webstore.phone, title: @webstore.title }
    assert_redirected_to webstore_path(assigns(:webstore))
  end

  test "should destroy webstore" do
    assert_difference('Webstore.count', -1) do
      delete :destroy, id: @webstore
    end

    assert_redirected_to webstores_path
  end
end
