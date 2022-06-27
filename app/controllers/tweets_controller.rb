class TweetsController < ApplicationController
  before_action :set_user, only: :index

  def index
    tweets =  @user.present? ? Tweet.by_user(@user.id) : []
    render json: tweets
  end

  private

  def set_user
    @user = User.find_by_username(params[:user_username])
  end
end
