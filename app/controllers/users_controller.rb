# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user!

  def show
    @users = User.where.not(id: current_user.id)
    @user = (User.find(params[:id]) if params[:id]) || current_user
  end

  private

  def set_user!
    @user = User.find[:username] if params[:username]
  end

  def permitted_params
    params.require(:user).permit(:username)
  end
end
