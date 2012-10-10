class Account < ActiveRecord::Base
  attr_accessible :healer_id, :user_id
end
