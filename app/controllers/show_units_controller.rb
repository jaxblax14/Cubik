class ShowUnitsController < ApplicationController
  before_action :set_challenge

  def activar_suscripcion
    redirect_to (show_units_unit_3_path(@challenge))
  end

  def unit_1
    @challenge_has_units = ChallengeHasUnit.all
  end

  def unit_2
    @challenge_has_units = ChallengeHasUnit.all
  end

  def unit_3
    @challenge_has_units = ChallengeHasUnit.all
  end

  def unit_4
    @challenge_has_units = ChallengeHasUnit.all
  end

  def unit_5
    @challenge_has_units = ChallengeHasUnit.all
  end

  def ending
    @challenge_has_units = ChallengeHasUnit.all
  end

  private
  def set_challenge
  	@challenge = Challenge.find(params[:challenge_id])
  end
end
