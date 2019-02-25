class DashboardController < ApplicationController
  def index
    def index
      @challenges = Challenge.all
    end
  
  end
end
