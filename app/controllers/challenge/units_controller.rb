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

private
  def set_challenge
    @challenge = Challenge.find(params[:challenge_id])
  end

  def set_challenge_has_stage
    if params[:challenge_has_unit_id].blank?
      @challenge_has_unit = @challenge.challenge_has_units.joins(:unit).order("units.index_order").first
    else
      @challenge_has_unit = ChallengeHasUnit.find(params[:challenge_has_unit_id])
    end
  end

end
