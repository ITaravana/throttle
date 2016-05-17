class VehiclesController < ApplicationController
  
  # respond_to :html, :js
  
  def new
    @vehicle = Vehicle.new
    @lastvehicle = Vehicle.last
    @vehicles = Vehicle.order(created_at: :desc).limit(16)
  end

  def create
     @vehicle = Vehicle.new(vehicle_params)

     respond_to do |format|
      if @vehicle.save 
        format.js # Will search for create.js.erb
        @lastvehicle = Vehicle.last
      else 
        format.html { render root_path }
      end 
    end
  end

  
  def index
    @vehicle = Vehicle.all
     if params[:tag]
    @vehicles = Vehicle.tagged_with(params[:tag])
  else
    @vehicles = Vehicle.all
  end
  end

  def show
     @vehicle = Vehicle.find(params[:id])
     @reservation =Reservation.new
     @user = User.find(@vehicle.user_id)
  end

  def update
    @vehicle = Vehicle.last
    
      if @vehicle.update(vehicle_params)

        redirect_to vehicle_path(@vehicle.id)
      else
        redirect "/"
    end
  end

  def delete
  end

private 
  def vehicle_params 
    params.require(:vehicle).permit(:user_id, :on_hire, :description, :ext_desc, :address, :city, :country, :min_day_rent, :max_day_rent, :price_per_day, :brand, :model, :image, :type, :model_year, :cc, :accessories, :all_tags) 
  end

end
