class Result < ActiveRecord::Base
  belongs_to :user_personal_test_session
  belongs_to :category, :foreign_key => :category_id
  attr_accessible :message, :user_personal_test_session_id, :category_id
  attr_accessible :score, :default => 0 
end
