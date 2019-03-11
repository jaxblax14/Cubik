class ChallengeIntroController < ApplicationController
  before_action(:set_challenge, only: [:intro,:new_project])
  
  def intro
    @units = Unit.all
    @challenge_has_units = ChallengeHasUnit.all 

  end 
  def new_project
    project = Project.new(unit_id: 1, challenge_id:  @challenge.id, project_state_id: 2, users_id: current_user.id)
    if project.save
      redirect_to(show_units_unit_1_path(project))
    end
  end


  private

  def set_challenge
  	@challenge = Challenge.find(params[:challenge_id])
  end

end
