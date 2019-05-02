class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :update]
  def show
  end

  def update
    if params[:user][:avatar].present? && current_user.update(avatar: params[:user][:avatar])
      flash[:notice] = 'Update avatar successfully'
    else
      flash[:danger] = 'Update avatar unsuccessfully'
    end
    redirect_to current_user
  end
end
