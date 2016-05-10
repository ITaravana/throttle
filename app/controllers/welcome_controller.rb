class WelcomeController < ApplicationController




  def index
  	@vehicle = Vehicle.new
  	@vehicles= Vehicle.all
  end
end
