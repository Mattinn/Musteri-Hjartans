class Result < ActiveRecord::Base
  belongs_to :user_personal_test_session
  attr_accessible :message, :user_personal_test_session_id
  attr_accessible :score, :default => 0 
end
