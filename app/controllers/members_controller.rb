class MembersController < ApplicationController
  # GET /users
  # GET /users.json
  
  def activate
    @user = User.find(params[:id])
    
    if@user.update_attribute(:is_approved, 1)
      @user.activate_user
      redirect_to "/members?is_approved=0"
    else
     redirect_to "/members?is_approved=0"
    end 
  end
  
  def deactivate
    @user = User.find(params[:id])
    
    if@user.update_attribute(:is_approved, 0)     
      redirect_to "/members?is_approved=1"
    else
      redirect_to "/members?is_approved=1"
    end 
  end
  
  def welcome
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
  
  #Returns all unapproved users or all the approved ones
  def index
    if params[:is_approved].to_i == 0
      @users = User.find_all_by_is_approved(0) #returns unapproved users 
    elsif params[:is_approved].to_i == 1
      @unsorted_users = User.where(:is_approved => 1, :is_admin => 0)
      @users = @unsorted_users.sort_by { |obj| obj.postal }  
    else
      redirect_to "/" #For bogus calls => return to root
    end
    
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end    
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
   
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end


  # GET /users/1/edit
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

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to '/user/welcome'}
        format.json { render json: @user, status: :created, location: @user }
        render :welcome
        
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    redirect_to :action => "new"
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html {  render action: "edit"}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to "/members?is_approved=0" }
      format.json { head :no_content }
    end
    
  end
  
end
