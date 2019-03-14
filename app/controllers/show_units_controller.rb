class ShowUnitsController < ApplicationController
  before_action(:set_project, include: :verification)

  def activar_suscripcion
    redirect_to (show_units_unit_3_path(@project))
  end

  def verification
    #el codigo es valido
    code_board = params[:board][:code_board]
    board = Board.find_by(code_board: code_board)
    if board.present?
      user = current_user.id
      if board.users_id.nil? || board.users_id == user
        if board.project_id.nil?
          flash[:notice]= 'Codigo aceptado, ahora puedes continuar con el desafio'
          board.users_id = user
          board.project = @project
          board.save
          redirect_to (show_units_unit_3_path(@project))
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

  def ending
    @challenge_has_units = @project.challenge.Challenge_has_units
    @challenge_has_unit = @challenge_has_units.find_by(unit_id: 4)
  end
  def finalizar_desafio
     @project.project_state_id = 3
     @project.boards.update(project_id: nil, users_id: nil)
    if @project.save
      flash[:notice] = 'Tu desafio  fue  finalizado correctamente'
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
