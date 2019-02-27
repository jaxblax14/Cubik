class DashboardController < ApplicationController
  def index
    @challenges = Challenge.all
  end
end
