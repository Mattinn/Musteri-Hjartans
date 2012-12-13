# encoding: utf-8
class AnsweredQuestion < ActiveRecord::Base
  belongs_to :user_personal_test_session
  belongs_to :category, :foreign_key => :category_id
  attr_accessible :answer, :question_id, :q_text, :q_value, :text_answer, :user_personal_test_session_id, :category_id
end
