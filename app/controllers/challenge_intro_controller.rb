class ChallengeIntroController < ApplicationController
  before_action(:set_challenge, only: [:intro])
  #before_action(:set_project, only: [:new_project, :project_params])
  
  def intro
    @units = Unit.all
    @challenge_has_units = ChallengeHasUnit.all
  
  end

  def new_project
    @project = Project.new(params[:challenge_id, :units])
    @project.project_state_id = 2
    if @project.save
    puts('~~ EL PROYECTO SE GUARDÓ ~~')
      flash[:notice] = 'Tu proyecto fue iniciado.'
      redirect_to(show_units_unit_1_path(@project))

    else
    puts('~~ EL PROYECTO NO SE GUARDÓ ~~')
    flash[:alert] = 'error al iniciar tu proyecto'
    redirect_back(fallback_location: request.referer)
    
    #falta agregar un redirect_back
    end 

  end

  private

  def set_challenge
  	@challenge = Challenge.find(params[:challenge_id])
  end
  
  def set_project 
    @project = Project.find(params[:project_id])
  end

  def project_params # talves no valla
    params.require(:project).permit(:project_state_id)
  end

end
