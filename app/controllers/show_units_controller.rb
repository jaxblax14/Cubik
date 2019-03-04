class ShowUnitsController < ApplicationController
  before_action(:set_challenge)
  def unit_1

  end

  def unit_2
  end

  def unit_3
  end

  def unit_4
  end

  def unit_5
  end

  def ending
  end

  def new_project
  
  end

  private
  def set_challenge
  	@challenge = Challenge.find(params[:challenge_id])
  end
end
