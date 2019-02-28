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
  
  def activate
  #activa el proyecto  con una id 2 de activado 
  if @project.boards.any? && @project.students.any?
    @project.state_id = 2
    @project.save
    @project.challenge.challenge_has_stages.each do |challenge_has_stage|
      new_phase = Phase.new(challenge_has_stage_id: challenge_has_stage.id, index_order: challenge_has_stage.stage.index_order)
      new_phase.questions = challenge_has_stage.stage.questions.where.not(is_deleted: true).order(:index_order).map do |question|
        { question_type_id: question.question_type_id, content: question.content, question_file_type_id: question.question_file_type_id }
      end
      @project.phases <<  new_phase
    end unless @project.phases.any?
    redirect_to(welcome_stages_index_path(@project))
  else
    flash[:notice]= 'Por favor ingrese los datos.'
    redirect_back(fallback_location: request.referer)
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

  def project_params # talves no valla
    params.require(:project).permit(:project_state_id)
  end

end
