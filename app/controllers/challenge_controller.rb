class ChallengeController < ApplicationController
  
  def index
    @challenge = Challenge.all
  end

  def new
    @challenge = Challenge.new
    @form_path = challenge_create_path
  end

  def create
    # Inicialización variables
    challenge = Challenge.new(challenge_params)

    # Validación presencia de todos los parámetros del formulario
    if challenge.title.blank? || challenge.description.blank?
      flash[:alert] = 'Debes completar todos los campos requeridos'
      redirect_back(fallback_location: request.referer) and return
    end

    if challenge.save
      # flash[:notice] = 'Tu desafío ha sido creado exitosamente'
      redirect_to(challenge_index_path(challenge))
    else
      flash[:notice] = 'Error al crear desafío'
      redirect_back(fallback_location: request.referer)
    end
  end

  private
  def set_challenge
    @challenge = Challenge.find(params[:challenge_id])
  end

  def challenge_params
    params.require(:challenge).permit(:title, :description)
  end
end
