class PostsController < ApplicationController
  def index
    @posts = User.find(params[:user_id]).posts
                .order(updated_at: :desc)
                .limit(params[:count])
                .reverse
  end
end
