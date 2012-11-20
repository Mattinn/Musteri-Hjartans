class UserPersonalTestSession < ActiveRecord::Base
  belongs_to :user
  belongs_to :personal_test
  belongs_to :category
  belongs_to :treatment
  belongs_to :result
  has_many :answered_questions
  
  attr_accessible :personal_test_id, :user_id, :category_id, :treatment_id, :result_id, :answered_question_ids 
  accepts_nested_attributes_for :answered_questions
  accepts_nested_attributes_for :personal_test
  
  def calculateResult
    self.result.score = 0
    self.personal_test.questions.each do |q|
      if q.answer != 0
        self.result.score += q.value
      end
      
    end
  end
  
  def answerQuestions
  self.personal_test.questions.each do |q|
    if q.id % 2 == 0 
      q.answer = 1
    end
    self.save!
  end  
end
  
end
