class Saying < ActiveRecord::Base
  attr_accessible :message
  
  def self.random
      if (c = count) != 0
        find(:first, :offset =>rand(c))
      end
  end
end
