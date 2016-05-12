class WelcomeController < ApplicationController




  def index
  	@vehicle = Vehicle.new
  	@vehicles= Vehicle.all
  	@lastvehicle = Vehicle.last
  end
end
