class Stock < ApplicationRecord
  belongs_to :ingredient
  belongs_to :store
end
