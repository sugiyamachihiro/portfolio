class UsersController < ApplicationController

def show
	@user = current_user
	@cats = @user.cats.all
	@favorites = @user.favorites.all
end


    private

    def user_params
        params.require(:user).permit(:nick_name, :user_name, :sex, :birthday, :postalcode, :prefecture, :address, :telephone_number, :email, :password)
    end
end