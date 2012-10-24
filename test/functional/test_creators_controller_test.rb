require 'test_helper'

class TestCreatorsControllerTest < ActionController::TestCase
  setup do
    @test_creator = test_creators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_creators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_creator" do
    assert_difference('TestCreator.count') do
      post :create, test_creator: { string: @test_creator.string, text: @test_creator.text }
    end

    assert_redirected_to test_creator_path(assigns(:test_creator))
  end

  test "should show test_creator" do
    get :show, id: @test_creator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_creator
    assert_response :success
  end

  test "should update test_creator" do
    put :update, id: @test_creator, test_creator: { string: @test_creator.string, text: @test_creator.text }
    assert_redirected_to test_creator_path(assigns(:test_creator))
  end

  test "should destroy test_creator" do
    assert_difference('TestCreator.count', -1) do
      delete :destroy, id: @test_creator
    end

    assert_redirected_to test_creators_path
  end
end
