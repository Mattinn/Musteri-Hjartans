class HealersController < ApplicationController
  # GET /healers
  # GET /healers.json
  def index
    @healers = Healer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @healers }
    end
  end

  # GET /healers/1
  # GET /healers/1.json
  def show
    @healer = Healer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @healer }
    end
  end

  # GET /healers/new
  # GET /healers/new.json
  def new
    @healer = Healer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @healer }
    end
  end

  # GET /healers/1/edit
  def edit
    @healer = Healer.find(params[:id])
  end

  # POST /healers
  # POST /healers.json
  def create
    @healer = Healer.new(params[:healer])

    respond_to do |format|
      if @healer.save
        format.html { redirect_to @healer, notice: 'Healer was successfully created.' }
        format.json { render json: @healer, status: :created, location: @healer }
      else
        format.html { render action: "new" }
        format.json { render json: @healer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /healers/1
  # PUT /healers/1.json
  def update
    @healer = Healer.find(params[:id])

    respond_to do |format|
      if @healer.update_attributes(params[:healer])
        format.html { redirect_to @healer, notice: 'Healer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @healer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /healers/1
  # DELETE /healers/1.json
  def destroy
    @healer = Healer.find(params[:id])
    @healer.destroy

    respond_to do |format|
      format.html { redirect_to healers_url }
      format.json { head :no_content }
    end
  end
end
