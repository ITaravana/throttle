
class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
    @bookings = Reservation.all.order('created_at DESC').paginate(page: params[:page], per_page: 2)
    @for_rent = Vehicle.all.order('created_at DESC').paginate(page: params[:page], per_page: 2)
  end

  def edit
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)

      if @user.save
        redirect_to user_path(@user.id)
      else
        redirect "/"
    end

  end

  def destroy
  end
end

private 
  def user_params 
    params.require(:user).permit(:first_name, :pic) 
  end