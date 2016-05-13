class Reservation < ActiveRecord::Base
	belongs_to :vehicle
	belongs_to :user 

 validate :uniqueness_of_date_range

  private
  def uniqueness_of_date_range
    errors.add(:check_in_date, "is not available") unless Reservation.where("? >= check_in_date AND ? <= check_out_date",
                                                            check_in_date, check_in_date).count == 0
    errors.add(:check_out_date, "is not available") unless Reservation.where("? >= check_in_date AND ? <= check_out_date",
                                                            check_out_date, check_out_date).count == 0
  end
end
