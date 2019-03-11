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

  def ending
    @challenge_has_units = @project.challenge.Challenge_has_units
    @challenge_has_unit = @challenge_has_units.find_by(unit_id: 4)
  end
  def finalizar_desafio
     @project.project_state_id = 3
     
    if @project.save
      flash[:notice] = "Tu projecto a finalizado correctamente"
      redirect_to(dashboard_index_path)
    end
  end
  def pasar_2
    @project.unit_id = 2
   if  @project.save
      redirect_to(show_units_unit_2_path(@project))
    end
  end
  def pasar_3
    @project.unit_id = 3
    @current_user.suscription = true
   if  @project.save && current_user.save
      redirect_to(show_units_unit_3_path(@project))
    end
  end
  private
  def set_challenge
  	@challenge = Challenge.find(params[:challenge_id])
  end

  def  set_project
    @project = Project.find(params[:project_id])
  end
end
