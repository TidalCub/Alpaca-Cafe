class Menu < ApplicationRecord
  belongs_to :store
  belongs_to :product
  has_one :category, through: :product
end
