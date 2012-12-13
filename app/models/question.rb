# encoding: utf-8
class Question < ActiveRecord::Base
  belongs_to :personal_test
  belongs_to :category, :foreign_key => :category_id
  #has_many :answered_questions, :autosave => true
  attr_accessible :question_text, :value, :user_personal_test_session_id, :personal_test_id, :personal_test, :category_id
end
