class SessionsController < ApplicationController
  def new
  end

  def login
    p session[:user_id]
    user = User.find_by(user_id: params[:user][:user_id])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.user_id
      render json: {}, status: :ok
    else
      render json: {}, status: :bad_request
    end
    p session[:user_id]
  end

end
