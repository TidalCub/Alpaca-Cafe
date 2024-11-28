class Category < ActiveRecord::Base
  has_many :products, dependent: :destroy
  has_many :menu, through: :products
end
