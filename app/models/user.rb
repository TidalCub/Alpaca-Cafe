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
end
