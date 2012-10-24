class TestCreatorsController < ApplicationController
  # GET /test_creators
  # GET /test_creators.json
  def index
    @test_creators = TestCreator.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @test_creators }
    end
  end

  # GET /test_creators/1
  # GET /test_creators/1.json
  def show
    @test_creator = TestCreator.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @test_creator }
    end
  end

  # GET /test_creators/new
  # GET /test_creators/new.json
  def new
    @test_creator = TestCreator.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @test_creator }
    end
  end

  # GET /test_creators/1/edit
  def edit
    @test_creator = TestCreator.find(params[:id])
  end

  # POST /test_creators
  # POST /test_creators.json
  def create
    @test_creator = TestCreator.new(params[:test_creator])

    respond_to do |format|
      if @test_creator.save
        format.html { redirect_to @test_creator, notice: 'Test creator was successfully created.' }
        format.json { render json: @test_creator, status: :created, location: @test_creator }
      else
        format.html { render action: "new" }
        format.json { render json: @test_creator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /test_creators/1
  # PUT /test_creators/1.json
  def update
    @test_creator = TestCreator.find(params[:id])

    respond_to do |format|
      if @test_creator.update_attributes(params[:test_creator])
        format.html { redirect_to @test_creator, notice: 'Test creator was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @test_creator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_creators/1
  # DELETE /test_creators/1.json
  def destroy
    @test_creator = TestCreator.find(params[:id])
    @test_creator.destroy

    respond_to do |format|
      format.html { redirect_to test_creators_url }
      format.json { head :no_content }
    end
  end
end
