class Result < ActiveRecord::Base
  has_one :user_personal_test_session
  belongs_to :category, :foreign_key => :category_id
  attr_accessible :message, :user_personal_test_session_id, :category_id
  attr_accessible :score
end
