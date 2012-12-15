class PersonalTestsController < ApplicationController
  before_filter :check_is_admin?, :only => [:new, :create, :edit, :update, :destroy]
  # GET /personal_tests
  # GET /personal_tests.json
  def index
    @personal_tests = PersonalTest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @personal_tests }
    end
  end

  # GET /personal_tests/1
  # GET /personal_tests/1.json
  def show
    @personal_test = PersonalTest.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @personal_test }
    end
  end

  # GET /personal_tests/new
  # GET /personal_tests/new.json
  def new
    @personal_test = PersonalTest.new
    
    2.times do #Defult new tests have 2 question fields
      question = @personal_test.questions.build
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @personal_test }
    end
  end

  # GET /personal_tests/1/edit
  def edit
    @personal_test = PersonalTest.find(params[:id])
  end

  # POST /personal_tests
  # POST /personal_tests.json
  def create
    @personal_test = PersonalTest.new(params[:personal_test])

    respond_to do |format|
      if @personal_test.save
        format.html { redirect_to "/personal_tests" }
        format.json { render json: @personal_test, status: :created, location: @personal_test }
      else
        format.html { render action: "new" }
        format.json { render json: @personal_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /personal_tests/1
  # PUT /personal_tests/1.json
  def update
    @personal_test = PersonalTest.find(params[:id])
    
    @test_session = UserPersonalTestSession.new
    @test_session.personal_test_id = @personal_test.id

    
    respond_to do |format|
      if @personal_test.update_attributes(params[:personal_test])
        format.html { redirect_to @personal_test}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @personal_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personal_tests/1
  # DELETE /personal_tests/1.json
  def destroy
    @personal_test = PersonalTest.find(params[:id])
    @personal_test.destroy

    respond_to do |format|
      format.html { redirect_to personal_tests_url }
      format.json { head :no_content }
    end
  end
end
