class Admins::UsersController < ApplicationController
  def index
  	@user = User.unscoped.all
    @users = @user.page(params[:page]).reverse_order.per(20)
  end

  def show
  end

  def update
  end

  def destroy
  end
end
