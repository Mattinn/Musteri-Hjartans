class AnsweredQuestion < ActiveRecord::Base
  belongs_to :user_personal_test_session
  attr_accessible :answer, :question_id, :q_text, :q_value, :text_answer, :user_personal_test_session_id
end
