class VotesController < ApplicationController
  def index
    @total = Totalizer.total
    render :thanks and return
  end

  def edit
    unless params[:key] == "icanupdatethis"
      redirect_to root_path and return
    end

    @total = Totalizer.total
    @updater_active = true
    render :thanks and return
  end

  def update
    Totalizer.additional = params[:amount].to_f
    redirect_to "/vote/edit"
  end

  def update_total
    Totalizer.update_base_amount
    render text: "Done"
  end
end
