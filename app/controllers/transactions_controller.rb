class TransactionsController < ApplicationController



def create

	@reservation = Reservation.find_by_user_id_and_vehicle_id(current_user.id,params[:vehicle_id])
	@vehicle = params[:vehicle_id]

    @result = Braintree::Transaction.sale(
              amount: @reservation.total_price,
              payment_method_nonce: params[:payment_method_nonce])
    if @result.success?
      @reservation.pay_check = false
      redirect_to vehicle_path(@vehicle), notice: "Congratulations! Your transaction has been a success!"
    else
      flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
      gon.client_token = generate_client_token
      render :new
    end
end

private
def generate_client_token
  Braintree::ClientToken.generate
end
	

end

