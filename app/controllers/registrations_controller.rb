class RegistrationsController < Devise::RegistrationsController
  protected
  
  # Allow the user to update his profile without entering the password
  #def update
    #@user = User.find(current_user.id)
    #email_changed = @user.email != params[:user][:email]
    #password_changed = !params[:user][:password].empty?

    #successfully_updated = if email_changed or password_changed
      #@user.update_with_password(params[:user])
    #else
      #@user.update_without_password(params[:user])
    #end

    #if successfully_updated
      # Sign in the user bypassing validation in case his password changed
      #sign_in @user, :bypass => true
      #redirect_to root_path
    #else
      #render "edit"
    #end
  #end
  
  # PUT /users/1
  # PUT /users/1.json
  #def update
    #@user = User.find(params[:id])

    #respond_to do |format|
      #if @user.update_attributes(params[:user])
        #format.html {  render action: "edit", notice: 'User was successfully updated.' }
        #format.json { head :no_content }
      #else
        #format.html { render action: "edit" }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
      #end
    #end
    
  #end
  
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
