class UserPersonalTestSession < ActiveRecord::Base
  belongs_to :user
  belongs_to :personal_test
  belongs_to :question
  belongs_to :category
  belongs_to :treatment
  belongs_to :result
  attr_accessible :personal_test_id, :question_id, :category_id, :treatment_id, :result_id
end