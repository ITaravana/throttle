class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

def banner_email
	@banner_mail = current_user.email
end





  protect_from_forgery with: :exception
end
