class UsersController < ApplicationController
  # before_action :authenticate_user!
  # after_action :verify_authorized

  def index
  	@users = User.all
  	# authorize User
  end

  def show
  	@user = User.find(params[:id])
  	# authorize User
  end

  def update
  	@user = User.find(params[:id])
  	# authorize User

  	# if @user.update_attributes(secure_params)
  	# 	redirect_to users_path, :notice => "User updated"
  	# else
  	# 	redirect_to users_path, :alert => "Insufficient Priveleges"
  	# end
  end

  private
  	def secure_params
  		params.require(:user).permit(:role)
  end
end
