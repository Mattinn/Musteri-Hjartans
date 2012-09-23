class ApplyController < ApplicationController
  # source: http://matharvard.ca/posts/2011/aug/22/contact-form-in-rails-3/
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    
    if @message.valid?
      ApplyFormMailer.new_message(@message).deliver
      redirect_to(root_path, :notice => "Message was successfully sent.")
    else
      flash.now.alert = "Please fill all fields."
      render :new
    end
  end
end
