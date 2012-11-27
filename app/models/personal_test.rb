class PersonalTest < ActiveRecord::Base
  has_many :questions, :dependent => :destroy
  has_many :user_personal_test_sessions
  attr_accessible :description, :name, :questions_attributes, :user_personal_test_sessions_attributes
  
  #Gives access to question attributes and removes blank question objects (in case there are any)  
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:question_text].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :user_personal_test_sessions, :allow_destroy => true
end
