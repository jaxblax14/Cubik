class ChallengeIntroController < ApplicationController
  before_action(:set_challenge, only: [:intro])
  #before_action(:set_project, only: [:new_project, :project_params])
  
  def intro
  
  end

def new_project
    #user = current_user.users.last
    project_has_unit = project_has_unit.find_or_create_by(challenge_id:  @challenge.id)
    project = Project.new(project_params)
    project.project_state_id = 1
    if project.save
    puts('~~ EL PROYECTO SE GUARDÓ ~~')
      flash[:notice] = 'Tu proyecto fue iniciado.'
      redirect_to(show_units_unit_1_path(project))
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
