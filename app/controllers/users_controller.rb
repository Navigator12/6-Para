class UsersController < ApplicationController
  before_action :set_user!

  def show; end

  private

  def set_user!
    @user = User.find[:username] if params[:username]
  end

  def permitted_params
    params.require(:user).permit(:username)
  end
end
