class UsersController < ApplicationController

def show
end


    private

    def user_params
        params.require(:user).permit(:nick_name, :user_name, :sex, :birthday, :postalcode, :prefecture, :address, :telephone_number, :email, :password)
    end

end
