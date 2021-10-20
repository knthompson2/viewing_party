class PartiesController < ApplicationController
  def new
    @movie = MovieFacade.search_by_id(params[:movie_id])
    @party = Party.new
  end

  def create
    party = Party.create(party_params)
    if party.save
      params[:party][:users].each do |user|
        Invitee.create(user_id: user, party_id: party.id)
      end
      Invitee.create(user: current_user, party: party)
      redirect_to user_dashboard_path(current_user)
      flash[:success] = 'Time to Party!'
    else
      redirect_to new_party_path(movie_id: params[:party][:movie_id])
      flash[:error] = 'All fields are required!'
    end
  end

  private

  def party_params
    params.require(:party).permit(:host, :movie_id, :title, :duration, :start_time, :date)
  end
end
