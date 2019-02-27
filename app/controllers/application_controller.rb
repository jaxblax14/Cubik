class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :authenticate_admin!
	def after_sign_in_path_for(resource)
		if current_user.roles.where(id:1).any?
      challenge_index_path
    elsif current_user.roles.where(id:2).any?
		  dashboard_index_path
		end
	end
	def authenticate_admin!
		if current_user.present?
			if current_user.roles.where(id:1).any?
				unless controller_name =="challenge" || devise_controller?
					flash[:alert] = "No tienes autorización para entrar en esa sección"
					redirect_to challenge_index_path
				end
			elsif current_user.roles.where(id:2).any?
				if controller_name =="challenge" 
					flash[:alert] = "No tienes autorización para entrar en esa sección"
					redirect_to dashboard_index_path
				end	
			end
		 else	
			unless devise_controller? || controller_name =="homepage"
				redirect_to homepage_index_path
			end
 		end
 	end
    protected
    
	def configure_permitted_parameters

	  devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name])

	  devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :date_of_birth])
	end
end
