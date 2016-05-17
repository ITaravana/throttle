class ChangeCc < ActiveRecord::Migration
  def change
  	remove_column :vehicles, :cc
  	add_column :vehicles, :cc, :string
  end
end
