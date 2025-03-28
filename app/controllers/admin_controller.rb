# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize!

  def index
    @stores = Store.all
  end

  def show
    @store = Store.find_by(slug: params[:store_name])
  end
end
