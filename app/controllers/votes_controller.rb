class VotesController < ApplicationController
  def index
    if cookies.key?(:responded)
      render :thanks
    else
      render :index
    end
  end

  def create
    Vote.create(answer: params[:answer], ip_address: request.remote_ip, user_agent: request.env["HTTP_USER_AGENT"])

    cookies[:responded] = true
    redirect_to root_path
  end
end
