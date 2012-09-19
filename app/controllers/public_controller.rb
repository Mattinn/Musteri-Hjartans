class PublicController < ApplicationController
  def index
    @params = params.to_s
  end

  def about
  end
  
  def specs
    @specialist = Specialist.find(params[:id])
  end

  
end
