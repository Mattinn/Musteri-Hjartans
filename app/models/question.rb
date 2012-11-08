  class Question < ActiveRecord::Base
  belongs_to :personal_test
  attr_accessible :answer, :question_text, :value
end
