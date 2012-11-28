class AnsweredQuestionsController < ApplicationController
  # GET /answered_questions
  # GET /answered_questions.json
  def index
    @answered_questions = AnsweredQuestion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @answered_questions }
    end
  end

  # GET /answered_questions/1
  # GET /answered_questions/1.json
  def show
    @answered_question = AnsweredQuestion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @answered_question }
    end
  end

  # GET /answered_questions/new
  # GET /answered_questions/new.json
  def new
    @answered_question = AnsweredQuestion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @answered_question }
    end
  end

  # GET /answered_questions/1/edit
  def edit
    @answered_question = AnsweredQuestion.find(params[:id])
  end

  # POST /answered_questions
  # POST /answered_questions.json
  def create
    @answered_question = AnsweredQuestion.new(params[:answered_question])

    respond_to do |format|
      if @answered_question.save
        format.html { redirect_to @answered_question}
        format.json { render json: @answered_question, status: :created, location: @answered_question }
      else
        format.html { render action: "new" }
        format.json { render json: @answered_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /answered_questions/1
  # PUT /answered_questions/1.json
  def update
    @answered_question = AnsweredQuestion.find(params[:id])

    respond_to do |format|
      if @answered_question.update_attributes(params[:answered_question])
        format.html { redirect_to @answered_question }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @answered_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answered_questions/1
  # DELETE /answered_questions/1.json
  def destroy
    @answered_question = AnsweredQuestion.find(params[:id])
    @answered_question.destroy

    respond_to do |format|
      format.html { redirect_to answered_questions_url }
      format.json { head :no_content }
    end
  end
end
