class Game < ApplicationRecord
  has_many :bees, dependent: :destroy
  validates :name, presence: true
end
