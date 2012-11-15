class Result < ActiveRecord::Base
  belongs_to :user_personal_test_session
  attr_accessible :message, :score
end
