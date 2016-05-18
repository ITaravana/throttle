class AddReservationChecker < ActiveRecord::Migration
  def change
	add_column :reservations, :pay_check, :boolean, default: false

  end
end
