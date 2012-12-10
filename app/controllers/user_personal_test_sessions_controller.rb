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
    
    @theResult = Result.create(:user_personal_test_session_id => @user_personal_test_session.id, :score => 0) #Create a result
    
    respond_to do |format|
      if @user_personal_test_session.update_attributes(params[:user_personal_test_session]) #If saving the session was sucessful
            
        @user_personal_test_session.answered_questions.all do |q| #loop through the answered questions
          
          sum = 0
          cat = 0
                 
           q.category_id.each do |a| #loop through every questions in current category
              if q.answer == 1
                 sum += a.q_value
                 cat += a.category_id
              end
           end
           
           if @theResult.score.nil? or sum > @theResult.score  #keep track of the highest score and category 
              @theResult.score = sum
              @theResult.category_id = cat
           end
              
          end #Back of the answered questions loop
          
          @theResult.save! #theResult now holds the category with the highest score
          
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
