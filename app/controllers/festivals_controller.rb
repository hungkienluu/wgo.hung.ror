class FestivalsController < ApplicationController

  respond_to :html, :json
    
  def index
    respond_with festivals
  end

  def show
    respond_with festival
  end

  def create
    festival.save
    respond_with festival
  end

  def update
    festival.update_attributes(params[:festival])
    respond_with festival
  end

  def destroy
    festival.destroy
    respond_with festival
  end
  
  private
  
  # Make these helpers available to the view too
  helper_method :festival, :festivals
  
  def festival
    # If the action is new or create...
    if @festival = params[:action] =~ /new|create/
      Festival.new(params[:festival])
    else
      Festival.find(params[:id])
    end
  end

  def festivals
    @festivals = Festival.all
  end
  
end