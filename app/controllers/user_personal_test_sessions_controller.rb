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
    
    @theResult = Result.new(:user_personal_test_session_id => @user_personal_test_session.id, :score => 0) #Create a result
    @theResult.save!
    @user_personal_test_session.result_id = @theResult.id
    
    respond_to do |format|
      if @user_personal_test_session.save
        
        @user_personal_test_session.personal_test.questions.each do |q| #loop thrugh the orginal questions, you DONT want to save these
          #Create answered_questions instance from the questions selected by the user  
          a = @user_personal_test_session.answered_questions.create(:question_id => q.id, :q_text => q.question_text, :q_value => q.value, :category_id => q.category_id)
          
        end
        
        format.html { redirect_to @user_personal_test_session }
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
    @user_personal_test_session = UserPersonalTestSession.find(params[:id]) #Find the session with the id given
    
    h = Hash.new {0} #hash for storing questions categories and values
    
    respond_to do |format|      
      
      if @user_personal_test_session.update_attributes(params[:user_personal_test_session]) #If saving the session was sucessful
      
          @user_personal_test_session.answered_questions.each { |q|  h[q.category_id] += q.q_value if q.answer == 1 } #loop through the answered questions
          
          @category, @score = h.max_by { |k, v| v } #find the question with the highest score
          
          @user_personal_test_session.result.update_attributes(:category_id => @category, :score => @score) #save the highest score and its category
          
        format.html { redirect_to @user_personal_test_session } #Return to the session page with the new resault
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
