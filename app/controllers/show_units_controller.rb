class ShowUnitsController < ApplicationController
  before_action :set_project

  def activar_suscripcion
    redirect_to (show_units_unit_3_path(@project))
  end

  def unit_1
    @challenge_has_units = @project.challenge.Challenge_has_units
    @challenge_has_unit = @challenge_has_units.find_by(unit_id: 1)
  end

  def unit_2
    @challenge_has_units = @project.challenge.Challenge_has_units
    @challenge_has_unit = @challenge_has_units.find_by(unit_id: 2)
  end

  def unit_3
    @challenge_has_units = @project.challenge.Challenge_has_units
    @challenge_has_unit = @challenge_has_units.find_by(unit_id: 3)
  end

  def unit_4
    @challenge_has_units = @project.challenge.Challenge_has_units
    @challenge_has_unit = @challenge_has_units.find_by(unit_id: 4)
  end

  def unit_5
    @challenge_has_units = @project.challenge.Challenge_has_units
    @challenge_has_unit = @challenge_has_units.find_by(unit_id: 5)
  end

  def ending
    @challenge_has_units = @project.challenge.Challenge_has_units
    @challenge_has_unit = @challenge_has_units.find_by(unit_id: 6)
  end

  private
  def set_challenge
  	@challenge = Challenge.find(params[:challenge_id])
  end

  def  set_project
    @project = Project.find(params[:project_id])
  end
end
