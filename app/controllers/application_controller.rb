# encoding: utf-8
class ApplicationController < ActionController::Base
  
  protect_from_forgery
  force_ssl
  helper_method :current_user
  
  def check_is_admin?
    if
      current_user && current_user.is_admin?
    else
      redirect_to "/users/sign_in", notice: 'Þú þarft að skrá þig inn með stjórnanda réttindi til að skoða þessa síðu.'
    end
  end

end
