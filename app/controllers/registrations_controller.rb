class RegistrationsController < Devise::RegistrationsController
  protected
  
  # Edit a user registration
  def edit
    @who = User.find(params[:id])
    if(current_user)
      if (current_user.id == @who.id)
        @user = User.find(params[:id])
      else
        redirect_to '/users/sign_in'
      end
    else
      redirect_to '/users/sign_in'
    end
  end
  
  # Redirect to welcome page after a successful registration
   def after_inactive_sign_up_path_for(resource)
    '/members/:id/welcome'
  end
  
end
