class SessionsController < ApplicationController

	def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to user    
		else
      flash[:error] = 'Invalid email/password combination'
			redirect_to root_path
      #render 'new'
    end
	end

end
