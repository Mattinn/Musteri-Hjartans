module ApplicationHelper
  
  #Helper that returns the current user
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def word_wrap(text, line_width = 30 ) 
    return text if line_width <= 0
    text.gsub(/\n/, ' ').gsub(/(.{1,#{line_width}})(\s+|$)/, "\\1\n").strip
  end
  
end
