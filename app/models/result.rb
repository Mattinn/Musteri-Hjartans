class Result < ActiveRecord::Base
  has_one :user_personal_test_session
  attr_accessible :message, :score
end
