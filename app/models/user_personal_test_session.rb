class UserPersonalTestSession < ActiveRecord::Base
  belongs_to :user
  belongs_to :personal_test
  belongs_to :category
  belongs_to :treatment
  belongs_to :result
  attr_accessible :personal_test_id, :user_id, :category_id, :treatment_id, :result_id
  
  def calculateResult
    self.result.score = 0
    self.personal_test.questions.each do |q|
      if q.answer != 0
        self.result.score += q.value
      end
    end
  end
  
end
