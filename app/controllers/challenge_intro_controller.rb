class ChallengeIntroController < ApplicationController
  before_action(:set_challenge, only: [:intro])
  def intro
    @units = Unit.all
  end


  private
  def set_challenge
  	@challenge = Challenge.find(params[:challenge_id])
  end

end
