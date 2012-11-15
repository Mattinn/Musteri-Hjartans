class UserPersonalTestSession < ActiveRecord::Base
  belongs_to :user_id
  belongs_to :personal_test_id
  belongs_to :question_id
  belongs_to :category_id
  belongs_to :treatment_id
  belongs_to :result_id
  # attr_accessible :title, :body
end
