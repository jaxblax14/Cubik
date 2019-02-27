class ChallengeIntroController < ApplicationController
  before_action(:set_challenge, only: [:intro])
  def intro
 
  end


  private
  def set_challenge
  	@challenge = Challenge.find(params[:challenge_id])
  end

end
