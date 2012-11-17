require 'test_helper'

class UserPersonalTestSessionsControllerTest < ActionController::TestCase
  setup do
    @user_personal_test_session = user_personal_test_sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_personal_test_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_personal_test_session" do
    assert_difference('UserPersonalTestSession.count') do
      post :create, user_personal_test_session: {  }
    end

    assert_redirected_to user_personal_test_session_path(assigns(:user_personal_test_session))
  end

  test "should show user_personal_test_session" do
    get :show, id: @user_personal_test_session
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_personal_test_session
    assert_response :success
  end

  test "should update user_personal_test_session" do
    put :update, id: @user_personal_test_session, user_personal_test_session: {  }
    assert_redirected_to user_personal_test_session_path(assigns(:user_personal_test_session))
  end

  test "should destroy user_personal_test_session" do
    assert_difference('UserPersonalTestSession.count', -1) do
      delete :destroy, id: @user_personal_test_session
    end

    assert_redirected_to user_personal_test_sessions_path
  end
end
