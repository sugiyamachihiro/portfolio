class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

#ログイン後遷移先
def after_sign_in_path_for(resource)
   case resource
   when Admin
     home_admins_path
   when User
     cats_path
   end
end

def after_sign_out_path_for(resource)
   case resource
   when :admin
     root_path
   when :user
     root_path
   end
end


helper_method :current_room

def current_room(cat_id)
  if Room.where(user_id: current_user.id).find_by(cat_id: cat_id)
    @room = Room.where(user_id: current_user.id).find_by(cat_id: cat_id)
  else
    @room = Room.create(:user_id => current_user.id ,:cat_id => cat_id )
  end
end

	protected
	  def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:nick_name, :user_name, :sex, :birthday, :postalcode, :prefecture, :address, :telephone_number])
	  end

end