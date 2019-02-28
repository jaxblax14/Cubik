class ChallengeIntroController < ApplicationController
  before_action(:set_challenge, only: [:intro])
  
  def intro
    @units = Unit.all
    @challenge_has_units = ChallengeHasUnit.all
  end

  private

  def set_challenge
  	@challenge = Challenge.find(params[:challenge_id])
  end
  
  def set_project 
    @project = Project.find(params[:project_id])
  end

  def project_params 
    params.require(:project).permit(:project_state_id)
  end

end
