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
end
