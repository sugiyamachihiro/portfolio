class UsersController < ApplicationController

def show
	@user = current_user
	@cats = @user.cats.all
	@favorites = @user.favorites.all
end

def update
	@user = User.find(params[:id])
	@user.update(user_params)
	sign_in(@user, bypass: true)
	redirect_to user_path(@user.id)
end

def destroy
	@user = User.find(params[:id])
	@user.destroy
	redirect_to root_path
end


    private

    def user_params
        params.require(:user).permit(:nick_name, :user_name, :sex, :birthday, :postalcode, :prefecture, :address, :telephone_number, :email, :password)
    end
end