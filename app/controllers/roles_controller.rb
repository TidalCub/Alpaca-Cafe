# frozen_string_literal: true

class RolesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize!

  def index
    @roles = Role.all
  end

  def show
    @role = Role.find(params[:id])
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(role_params)
    if @role.save
      redirect_to roles_path, notice: 'Role created successfully'
    else
      render :new
    end
  end

  def update
    @role = Role.find(params[:id])
    if @role.update(role_params)
      redirect_to @role
    else
      render :edit
    end
  end

  private

  def role_params
    params.expect(role: [:name]).merge(uuid: make_uuid)
  end

  def make_uuid
    params[:role][:name].downcase
  end
end
