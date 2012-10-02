class VotesController < ApplicationController
  def index
    @total = File.read(Rails.root.join("/tmp/hairy-total.txt"))

    if cookies.key?(:responded)
      @scoreboard = Vote.connection.execute("SELECT answer, COUNT(answer) AS number FROM votes GROUP BY answer ORDER BY number DESC")
      render :thanks
    else
      render :index
    end
  end

  def create
    unless params.key?(:answer)
      redirect_to(root_path, alert: "You should probably pick an option first") and return
    end

    Vote.create(answer: params[:answer], ip_address: request.remote_ip, user_agent: request.env["HTTP_USER_AGENT"])

    cookies[:responded] = true
    redirect_to root_path
  end
end
