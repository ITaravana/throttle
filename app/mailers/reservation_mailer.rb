class ReservationMailer < ApplicationMailer

	default from:'iamthebou@gmail.com'
 
  def booking_email(customer_id, host_id, reservation_id)
    @customer = User.find(customer_id)
    @host = User.find(host_id) 
    @reservation_id=reservation_id
    # @url= 'http://example.com/login'
    mail(to: @customer.email, subject: 'Thanks for booking at Throttle', body: "Lalalala! You've booked a motorbike yippika yay!",)
  end

end
