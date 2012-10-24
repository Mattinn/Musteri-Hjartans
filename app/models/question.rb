class Question < ActiveRecord::Base
  belongs_to :test_creator
  attr_accessible :question, :tag
end
