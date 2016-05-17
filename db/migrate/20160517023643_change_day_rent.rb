class ChangeDayRent < ActiveRecord::Migration
  def change
  	remove_column :vehicles, :min_day_rent
  	remove_column :vehicles, :max_day_rent
	add_column :vehicles, :min_day_rent, :string
  	add_column :vehicles, :max_day_rent, :string
  end
end