class UsersController < ApplicationController
	def	index
		@state_array = %w(AK AL AR AZ CA CO CT DC DE FL GA HI IA ID IL IN KS KY LA MA MD ME MI MN MO MS MT NC ND NE NH NJ NM NV NY OH OK OR PA RI SC SD TN TX UT VA VT WA WI WV WY)
	end
	def create
		location = Location.where(location_params)
		if location.nil?
			location = Location.new(location_params)
		end
		if location.save
			user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], location: Location.where(location_params).first, password: params[:password], password_confirmation: params[:password_confirmation])
			if user.save 
				session[:user_id] = user.id
				render text: "success"
			else 
				flash[:errors] = user.errors.full_messages
				redirect_to :back
			end
		else 
			flash[:errors] = location.errors.full_messages
			redirect_to :back
		end
	end
private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end
	def location_params
		params.require(:location).permit(:city, :state)
	end
end
