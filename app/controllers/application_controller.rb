class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def newsfeed
    @posts = Post.limit(10).order(created_at: :desc)
  end

  def accounts
    @users = User.all
  end
end
