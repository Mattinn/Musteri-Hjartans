class Question < ActiveRecord::Base
  belongs_to :personal_test
  has_many :answered_questions
  attr_accessible :answer, :question_text, :value, :user_personal_test_session_id, :personal_test_id, :answered_question_ids
end
