class UserPersonalTestSessionsController < ApplicationController
  # GET /user_personal_test_sessions
  # GET /user_personal_test_sessions.json
  def index
    @user_personal_test_sessions = UserPersonalTestSession.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_personal_test_sessions }
    end
  end

  # GET /user_personal_test_sessions/1
  # GET /user_personal_test_sessions/1.json
  def show
    @user_personal_test_session = UserPersonalTestSession.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_personal_test_session }
    end
  end

  # GET /user_personal_test_sessions/new
  # GET /user_personal_test_sessions/new.json
  def new
    @user_personal_test_session = UserPersonalTestSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_personal_test_session }
    end
  end

  # GET /user_personal_test_sessions/1/edit
  def edit
    @user_personal_test_session = UserPersonalTestSession.find(params[:id])
  end

  # POST /user_personal_test_sessions
  # POST /user_personal_test_sessions.json
  def create
    @user_personal_test_session = UserPersonalTestSession.new(params[:user_personal_test_session])

    respond_to do |format|
      if @user_personal_test_session.save
        format.html { redirect_to @user_personal_test_session, notice: 'User personal test session was successfully created.' }
        format.json { render json: @user_personal_test_session, status: :created, location: @user_personal_test_session }
      else
        format.html { render action: "new" }
        format.json { render json: @user_personal_test_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_personal_test_sessions/1
  # PUT /user_personal_test_sessions/1.json
  def update
    #params[:personal_test][:question_ids] ||= []
    @user_personal_test_session = UserPersonalTestSession.find(params[:id])
    @theResault = @user_personal_test_session.personal_test.resault
    
    @user_personal_test_session.personal_test.questions.each do |q|
      #if params[:checked] == true
      #q.value = 
      end
      
    #  @theResault =
      
   end
      
       

    respond_to do |format|
      if @user_personal_test_session.update_attributes(params[:user_personal_test_session])
        format.html { redirect_to @user_personal_test_session, notice: 'User personal test session was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_personal_test_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_personal_test_sessions/1
  # DELETE /user_personal_test_sessions/1.json
  def destroy
    @user_personal_test_session = UserPersonalTestSession.find(params[:id])
    @user_personal_test_session.destroy

    respond_to do |format|
      format.html { redirect_to user_personal_test_sessions_url }
      format.json { head :no_content }
    end
  end
end
