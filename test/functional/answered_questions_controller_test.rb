require 'test_helper'

class AnsweredQuestionsControllerTest < ActionController::TestCase
  setup do
    @answered_question = answered_questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:answered_questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create answered_question" do
    assert_difference('AnsweredQuestion.count') do
      post :create, answered_question: { answer: @answered_question.answer, question_id: @answered_question.question_id, text_answer: @answered_question.text_answer, user_personal_test_session_id: @answered_question.user_personal_test_session_id }
    end

    assert_redirected_to answered_question_path(assigns(:answered_question))
  end

  test "should show answered_question" do
    get :show, id: @answered_question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @answered_question
    assert_response :success
  end

  test "should update answered_question" do
    put :update, id: @answered_question, answered_question: { answer: @answered_question.answer, question_id: @answered_question.question_id, text_answer: @answered_question.text_answer, user_personal_test_session_id: @answered_question.user_personal_test_session_id }
    assert_redirected_to answered_question_path(assigns(:answered_question))
  end

  test "should destroy answered_question" do
    assert_difference('AnsweredQuestion.count', -1) do
      delete :destroy, id: @answered_question
    end

    assert_redirected_to answered_questions_path
  end
end
