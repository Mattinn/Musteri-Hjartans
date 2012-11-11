class PersonalTest < ActiveRecord::Base
  has_many :questions, :dependent => :destroy
  attr_accessible :description, :name, :result, :questions_attributes
  
  #Gives access to question attributes and removes blank question objects (incase there are any)  
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:question_text].blank? }, :allow_destroy => true
  
end
