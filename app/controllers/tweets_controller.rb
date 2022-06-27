class TweetsController < ApplicationController
  before_action :set_user, only: :index
  before_action :paginate, only: :index

  def index
    tweets =  @user.present? ? Tweet.by_user(@user.id) : []

    render json: tweets.limit(@per.to_i).offset(@per.to_i * @page.to_i)
  end

  private

  def paginate
    @per, @page = params[:per], params[:page]
  end

  def set_user
    @user = User.find_by_username(params[:user_username])
  end
end
