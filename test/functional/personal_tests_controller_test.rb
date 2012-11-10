require 'test_helper'

class PersonalTestsControllerTest < ActionController::TestCase
  setup do
    @personal_test = personal_tests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:personal_tests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create personal_test" do
    assert_difference('PersonalTest.count') do
      post :create, personal_test: { description: @personal_test.description, name: @personal_test.name, result: @personal_test.result }
    end

    assert_redirected_to personal_test_path(assigns(:personal_test))
  end

  test "should show personal_test" do
    get :show, id: @personal_test
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @personal_test
    assert_response :success
  end

  test "should update personal_test" do
    put :update, id: @personal_test, personal_test: { description: @personal_test.description, name: @personal_test.name, result: @personal_test.result }
    assert_redirected_to personal_test_path(assigns(:personal_test))
  end

  test "should destroy personal_test" do
    assert_difference('PersonalTest.count', -1) do
      delete :destroy, id: @personal_test
    end

    assert_redirected_to personal_tests_path
  end
end
