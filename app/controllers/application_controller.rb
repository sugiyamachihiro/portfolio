class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

#ログイン後遷移先
def after_sign_in_path_for(resource)
   case resource
   when Admin
     cats_path
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

	protected
	  def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:nick_name, :user_name, :sex, :birthday, :postalcode, :prefecture, :address, :telephone_number])
	  end

end