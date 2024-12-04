# frozen_string_literal: true

class Recipe < ApplicationRecord
  belongs_to :ingredient_group
  belongs_to :product
end
