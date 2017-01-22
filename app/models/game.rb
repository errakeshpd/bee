class Game < ApplicationRecord
  has_many :bees, dependent: :destroy
end
