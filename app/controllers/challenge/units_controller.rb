class Challenge::UnitsController < ApplicationController
  before_action(:set_challenge, only: [:assign, :edit, :save_assign, :update])
  before_action(:set_challenge_has_unit, only: [:edit, :update]) 
  def assign
    @units = Unit.all.order(:index_order)
  end

  def edit
  end

  def save_assign
    unit_ids = (params[:units] || {}).keys
    if unit_ids.blank?
      flash[:notice] = 'Debes seleccionar al menos una etapa'
      redirect_back(fallback_location: request.referer) and return
    end

    @challenge.challenge_has_units.where.not(unit_id: unit_ids).delete_all
    unit_ids.each do |unit_id|
      unless @challenge.challenge_has_units.where(unit_id: unit_id).any?
        @challenge.challenge_has_units << ChallengeHasUnit.new(unit_id: unit_id)
      end
    end
    redirect_to(challenges_stages_edit_path(@challenge))
  end

  def update
    if @challenge_has_unit.update(challenge_has_unit_params)
      next_challenge_has_unit =  @challenge.challenge_has_units
                                    .joins(:unit)
                                    .where('units.index_order > ?', @challenge_has_unit.unit.index_order)
                                    .order("units.index_order").first
      if next_challenge_has_unit.present?
        redirect_to(challenges_units_edit_path(@challenge, next_challenge_has_unit))
      else
        #@challenge.update(is_published: true)
        redirect_to(challenges_index_path)
      end
    else
      redirect_back(fallback_location: request.referer)
    end
  end

private
  def set_challenge
    @challenge = Challenge.find(params[:challenge_id])
  end

  def set_challenge_has_unit
    if params[:challenge_has_unit_id].blank?
      @challenge_has_unit = @challenge.challenge_has_units.joins(:unit).order("units.index_order").first
    else
      @challenge_has_unit = ChallengeHasUnit.find(params[:challenge_has_unit_id])
    end
  end
  def challenge_has_unit_params
    params.require(:challenge_has_unit).permit(:instructions)
  end

end
