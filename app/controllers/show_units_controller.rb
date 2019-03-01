class ShowUnitsController < ApplicationController
  before_action :set_challenge

def activar_suscripcion
  redirect_to (show_units_unit_3_path(@challenge))
end

  def unit_1
    @challenge_has_units = ChallengeHasUnit.all
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

  private
  def set_challenge
  	@challenge = Challenge.find(params[:challenge_id])
  end
end
