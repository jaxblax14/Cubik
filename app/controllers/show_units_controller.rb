class ShowUnitsController < ApplicationController
  before_action(:set_project, except: [:verification])

  def activar_suscripcion
    redirect_to (show_units_unit_3_path(@project))
  end

  def verification
    #el codigo es valido
    code_board = params[:board][:code_board]
    board = Board.find_by(code_board: code_board)
    if board.present?
      user = current_user.last
      if board.users_id.nil? || board.users_id == user.id
        if board.project_id.nil?
          flash[:notice]= 'Codigo aceptado, ahora puedes continuar con el desafio'
          board.user = user
          board.project = @project 
          board.save
          redirect_back(fallback_location: request.referer)
        else
          flash[:alert]= 'Placa ya asociada a un proyecto.'
          redirect_back(fallback_location: request.referer)
        end
      else
        flash[:notice]= 'Placa ya ascociada a otro usuario.'
        redirect_back(fallback_location: request.referer)
      end
    else 
      flash[:error]='Codigo no encontrado'
      redirect_back(fallback_location: request.referer)
      #termino validacion
    end 
  end

  def unit_1
    @challenge_has_units = @project.challenge.Challenge_has_units
    @challenge_has_unit = @challenge_has_units.find_by(unit_id: 1)
  end

  def unit_2
    @challenge_has_units = @project.challenge.Challenge_has_units
    @challenge_has_unit = @challenge_has_units.find_by(unit_id: 2)
    @form_path = show_units_verification_path @project
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
