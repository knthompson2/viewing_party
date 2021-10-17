class PartiesController < ApplicationController
  def new
    @movie = MovieFacade.search_by_id(params[:movie_id])
    @party = Party.new
  end

  def create
    party = Party.create(party_params)
    if party.save
      require "pry"; binding.pry
      redirect_to user_dashboard_path(current_user)
      flash[:success] = "Time to Party!"
    else
      redirect_to new_party_path(current_user)
      flash[:error] = "All fields are required!"
    end
  end

  private

  def party_params
    params.require(:party).permit(:user_id, :movie_id, :title, :duration, :start_time, :date)
  end
end
