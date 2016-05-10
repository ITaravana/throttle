class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
    	t.integer :user_id
    	t.boolean :on_hire
    	t.string :description
    	t.string :address
    	t.string :city
    	t.string :country
    	t.integer :min_day_rent
    	t.integer :max_day_rent
    	t.integer :price_per_day
    	t.string :brand
    	t.string :model
    	t.string :image1
    	t.string :image2
    	t.string :image3
    	t.string :type_vehicle
    	t.string :model_year
    	t.integer :cc
    	t.string :accessories
      t.timestamps null: false
    end
  end
end
