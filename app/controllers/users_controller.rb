class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new user_params
		if @user.save
			flash[:notice] = "User created successfully"
			redirect_to home_path
		else
			render 'new'
		end
	end

	def edit
		@user = User.find params[:id]
	end

	def update
		@user = User.find params[:id]
		if @user.update_attributes user_params
			flash[:notice] = "User updated successfully"
			redirect_to home_path
		else
			render 'edit'
		end
	end

	private

	def user_params
		params.require(:user).permit(:username, :password)
	end
end
