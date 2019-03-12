class WizzarBlocklyController < ApplicationController
  def tutorial
  end

  def tutorial_true
  	 @current_user.tutorial = true
  	if current_user.save 
  		redirect_to(dashboard_index_path)
  	end	
  end
end
