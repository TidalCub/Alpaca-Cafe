# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders, dependent: :nullify
  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles
  after_create_commit :create_stripe_user

  def basket
    orders.where(state: %i[pending on_checkout]).last || orders.create(state: :pending)
  end

  def create_stripe_user
    # rubocop:disable Layout/FirstHashElementIndentation
    return if Rails.env.test?

    customer = Stripe::Customer.create({
      email: email,
      metadata: {
        user_id: id
      }
    })
    self.stripe_id = customer.id
    save
    # rubocop:enable Layout/FirstHashElementIndentation
  end

  def add_role(role)
    return if roles.exists?(uuid: role)

    user_roles.create(role: Role.find_by(uuid: role))
  end

  def remove_role(role)
    return unless roles.exists?(uuid: role)

    user_roles.where(role: Role.find_by(uuid: role)).destroy_all
  end
end
