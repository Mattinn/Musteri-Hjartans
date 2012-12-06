# encoding: utf-8
class Saying < ActiveRecord::Base
  attr_accessible :message, :defult_msg
  attr_accessor :defult_msg
  
  def self.random
      if (c = count) == 0
        Saying.create(:message => "Leyndarmálið við að halda sér ungum er að vera heiðarlegur, borða hægt og að ljúga til um aldur sinn - Lucille Ball")
      else
        find(:first, :offset =>rand(c))
      end
  end
  
end
