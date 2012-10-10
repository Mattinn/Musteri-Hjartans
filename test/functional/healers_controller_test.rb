require 'test_helper'

class HealersControllerTest < ActionController::TestCase
  setup do
    @healer = healers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:healers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create healer" do
    assert_difference('Healer.count') do
      post :create, healer: { name: @healer.name, postal_code: @healer.postal_code }
    end

    assert_redirected_to healer_path(assigns(:healer))
  end

  test "should show healer" do
    get :show, id: @healer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @healer
    assert_response :success
  end

  test "should update healer" do
    put :update, id: @healer, healer: { name: @healer.name, postal_code: @healer.postal_code }
    assert_redirected_to healer_path(assigns(:healer))
  end

  test "should destroy healer" do
    assert_difference('Healer.count', -1) do
      delete :destroy, id: @healer
    end

    assert_redirected_to healers_path
  end
end
