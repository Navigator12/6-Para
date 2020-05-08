class StreamsController < ApplicationController
  def index
    @all_news = Post.where(user_id: current_user.following.pluck(:id))
  end
end
