class RegistrationsController < Devise::RegistrationsController
  protected
  
  # Allow the user to update his profile without entering the password
  def update
    @user = User.find(current_user.id)
    email_changed = @user.email != params[:user][:email]
    password_changed = !params[:user][:password].empty?

    successfully_updated = if email_changed or password_changed
      @user.update_with_password(params[:user])
    else
      @user.update_without_password(params[:user])
    end

    if successfully_updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to root_path
    else
      render "edit"
    end
  end
  
  # Redirect to welcome page after a successful registration
   def after_inactive_sign_up_path_for(resource)
    '/members/:id/welcome'
  end
  
end
