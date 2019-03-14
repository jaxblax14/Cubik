class ChallengeController < ApplicationController
  before_action(:set_challenge, only: [:edit, :update])

  def index
    @challenge = Challenge.all
  end

  def pasar_a_new
    @current_user.suscription = true
   if  current_user.save
      redirect_to(challenge_new_path)
    end
  end  

  def new
    @challenge = Challenge.new
    @form_path = challenge_create_path
  end

  def edit
    @form_path = challenge_update_path(@challenge)
  end

  def create
    # Inicialización variables
    challenge = Challenge.new(challenge_params)
    
    # Validación presencia de todos los parámetros del formulario
    if challenge.title.blank? || challenge.description.blank? || challenge.introduction.blank?
      flash[:alert] = 'Debes completar todos los campos requeridos'
      redirect_back(fallback_location: request.referer) and return
    end

    if challenge.save
      challenge.update(users_id: current_user.id)
      flash[:notice] = 'Tu desafío ha sido creado exitosamente'
      redirect_to(challenge_units_assign_path(challenge))
    else
      flash[:notice] = 'Error al crear desafío'
      redirect_back(fallback_location: request.referer)
    end
  end

  def update
    if @challenge.update(challenge_params)
      flash[:notice] = 'se actualizo correctamente'
      redirect_to(challenge_units_assign_path(@challenge))
    else
      flash[:alert] = 'Error al actualizar'
      redirect_back(fallback_location: request.referer)
    end
  end

  private
  def set_challenge
    @challenge = Challenge.find(params[:challenge_id])
  end

  def challenge_params
    params.require(:challenge).permit(:title, :description, :introduction, :is_public , :users_id)
  end
end
