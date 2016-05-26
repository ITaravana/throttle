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

  def map
    @vehicle = Vehicle.where.not(latitude: nil)
  end

  
  def index
      @vmapper = Vehicle.where.not(latitude: nil)
      @vmap = @vmapper.last

      if params[:tag]
        @vehicles = Vehicle.tagged_with(params[:tag])
      else
        @vehicles = Vehicle.all.order('created_at DESC').paginate(page: params[:page], per_page: 4)
      end
  end

  def show
     @vehicle = Vehicle.find(params[:id])
     @reservation =Reservation.new
     @user = User.find(@vehicle.user_id)
     if !Reservation.find_by_user_id_and_vehicle_id(current_user.id, @vehicle.id).nil?
     @total_price = Reservation.find_by_user_id_and_vehicle_id(current_user.id, @vehicle.id).total_price
     @beginning = Reservation.find_by_user_id_and_vehicle_id(current_user.id, @vehicle.id).check_in_date
     @end = Reservation.find_by_user_id_and_vehicle_id(current_user.id, @vehicle.id).check_out_date
     @days = (@end - @beginning).to_i
   end
     gon.client_token = generate_client_token
  end

  def update
    @vehicle = Vehicle.last
    
      if @vehicle.update(vehicle_params)

        redirect_to vehicle_path(@vehicle.id)
      else
        redirect "/"
    end
  end

  def destroy
    @vehicle = Vehicle.find(params[:id])
    @reservation = Reservation.find_by_user_id_and_vehicle_id(current_user.id, @vehicle.id)
    @cancel = @reservation.destroy
    redirect_to vehicle_path(@vehicle.id)
  end


private 
  def vehicle_params 
    params.require(:vehicle).permit(:type_vehicle, :user_id, :on_hire, :description, :ext_desc, :address, :city, :country, :min_day_rent, :max_day_rent, :price_per_day, :brand, :model, :image, :type, :model_year, :cc, :accessories, :all_tags) 
  end

def generate_client_token
  Braintree::ClientToken.generate
end

end
