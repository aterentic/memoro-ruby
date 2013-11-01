class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	include SessionsHelper

	def index
		if signed_in?
			redirect_to user_path(current_user)
		end
	end
end
