class UserPersonalTestSession < ActiveRecord::Base
  belongs_to :user
  belongs_to :personal_test
  belongs_to :category
  belongs_to :treatment
  belongs_to :result
  has_many :answered_questions
  
  attr_accessible :personal_test_id, :user_id, :category_id, :treatment_id, :result_id, :answered_question_ids, :answered_questions_attributes
  attr_accessible :personal_test, :user, :category, :treatment, :result, :answered_questions, :personal_test_attributes
  accepts_nested_attributes_for :answered_questions
  accepts_nested_attributes_for :personal_test
  
end
