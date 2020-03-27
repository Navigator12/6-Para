class PostsController < ApplicationController
  def create
    current_user.posts.create(posts_params)

    redirect_to root_path
  end

  private

  def posts_params
    params.require(:post).permit(:description)
  end
end
