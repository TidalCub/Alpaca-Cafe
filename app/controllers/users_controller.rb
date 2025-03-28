# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
  end

  def show
    @user = current_user
    authorize! @user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update_role
    params = role_params
    @user = User.find(params[:id])
    if params[:commit].downcase == 'add role'
      @user.add_role(params[:role_id])
    elsif params[:commit].downcase == 'remove role'
      @user.remove_role(params[:role_id])
    end
    redirect_to user_path(@user), notice: 'Role updated successfully'
  end

  private

  def role_params
    params.permit(:role_id, :commit, :id)
  end
end
