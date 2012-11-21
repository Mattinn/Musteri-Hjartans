class WebstoresController < ApplicationController
  # GET /webstores
  # GET /webstores.json
  def index
    @webstores = Webstore.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @webstores }
    end
  end

  # GET /webstores/1
  # GET /webstores/1.json
  def show
    @webstore = Webstore.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @webstore }
    end
  end

  # GET /webstores/new
  # GET /webstores/new.json
  def new
    @webstore = Webstore.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @webstore }
    end
  end

  # GET /webstores/1/edit
  def edit
    @webstore = Webstore.find(params[:id])
  end

  # POST /webstores
  # POST /webstores.json
  def create
    @webstore = Webstore.new(params[:webstore])

    respond_to do |format|
      if @webstore.save
        format.html { redirect_to @webstore, notice: 'Webstore was successfully created.' }
        format.json { render json: @webstore, status: :created, location: @webstore }
      else
        format.html { render action: "new" }
        format.json { render json: @webstore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /webstores/1
  # PUT /webstores/1.json
  def update
    @webstore = Webstore.find(params[:id])

    respond_to do |format|
      if @webstore.update_attributes(params[:webstore])
        format.html { redirect_to @webstore, notice: 'Webstore was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @webstore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /webstores/1
  # DELETE /webstores/1.json
  def destroy
    @webstore = Webstore.find(params[:id])
    @webstore.destroy

    respond_to do |format|
      format.html { redirect_to webstores_url }
      format.json { head :no_content }
    end
  end
end
