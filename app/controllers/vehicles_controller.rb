class VehiclesController < ApplicationController
  
  # respond_to :html, :js
  
  def new
  end

  def create
     @vehicle = Vehicle.new(vehicle_params)
     respond_to do |format|
      if @vehicle.save 
        format.js # Will search for create.js.erb
      else 
        format.html { render root_path }
      end 
    end
  end

  
  def index
    @vehicle = Vehicle.all
  end

  def show
  end

  def update
  end

  def delete
  end

private 
  def vehicle_params 
    params.require(:vehicle).permit(:user_id, :on_hire, :description, :address, :city, :country, :min_day_rent, :max_day_rent, :price_per_day, :brand, :model, :image1, :image2, :image3, :type, :model_year, :cc, :accessories, :all_tags) 
  end

end
