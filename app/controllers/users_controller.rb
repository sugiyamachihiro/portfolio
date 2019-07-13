class UsersController < ApplicationController
	before_action :authenticate_user!

def show
	@user = User.find(params[:id])
	@cat = @user.cats
	@cats = @user.cats.page(params[:page]).reverse_order.per(10)
	@favorites = @user.favorites.page(params[:page]).reverse_order.per(10)
	@fromrooms = @user.rooms.page(params[:page]).reverse_order.per(10)
end

def update
	@user = User.find(params[:id])
	@user.update(user_params)
	redirect_to user_path(@user.id)
end

def destroy
	@user = User.find(params[:id])
	@user.destroy
	redirect_to root_path
end


    private

    def user_params
        params.require(:user).permit(:nick_name, :user_name, :sex, :birthday, :postalcode, :prefecture, :address, :telephone_number, :profession, :introduction, :email, :password)
    end
end