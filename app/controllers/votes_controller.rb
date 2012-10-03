class VotesController < ApplicationController
  def index
    @total = Totalizer.total
    render :thanks and return
  end

  def edit
    @total = Totalizer.total
    @updater_active = true
    render :thanks and return
  end

  def update
    Totalizer.additional = params[:amount].to_f
    redirect_to "/vote/edit"
  end
end
