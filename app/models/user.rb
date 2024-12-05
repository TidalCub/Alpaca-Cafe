# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders, dependent: :nullify
  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles

  def basket
    orders.pending.last || orders.create(state: :pending)
  end
end
