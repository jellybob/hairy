class VotesController < ApplicationController
  def index
    @total = Totalizer.total
    render :thanks and return
  end
end
