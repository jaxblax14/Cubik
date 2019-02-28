class ChallengeIntroController < ApplicationController
  before_action(:set_challenge, only: [:intro,:new_project])
  before_action(:set_ṕroject, only: [:activate])
  
  def intro
  
  end

  def new_project
    school = current_user.users.last
    school_has_challenge = school.school_has_challenges.find_or_create_by(challenge_id:  @challenge.id)
    project = Project.new(school_has_challenge: school_has_challenge)
    project.state_id = 1
    if project.save
      redirect_to(show_and_activation_challenges_new_path(project))
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
end
