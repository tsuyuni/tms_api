class UsersController < ApplicationController
  before_action :check, only: [:index, :show]
  before_action :set_user, only: [:show, :signup]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  def signup
    @user = User.new(user_params)

    if @user.save
      return true
    else
      return false
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by(user_id: params[:user_id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:user_id, :name, :password, :password_confirmation)
    end

    def check
      p session.keys
      if session[:user_id].nil?
        return nil, status: :bad_request
      end
    end
end
