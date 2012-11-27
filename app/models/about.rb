class About < ActiveRecord::Base
  attr_accessible :content, :title
  attr_accessor :defult_msg
  
  def self.random
      if (c = count) == 0
        "Það eru engin spakmæli í grunninum"
      else
        find(:first, :offset =>rand(c))
      end
  end
  
end
