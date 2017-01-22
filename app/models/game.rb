class Game < ApplicationRecord
  has_many :bees, dependent: :destroy
  validates :name, presence: true

  after_create :build_bees


  def build_bees
    ['drone', 'worker', 'queen'].each do |bee_type|
      count = if bee_type == "drone"
        8
      elsif bee_type == 'worker'
        5
      else
        1
      end

      (1..count).each do |b|
        bees.create(type: Bee.type(bee_type), lifespan: Bee.life_span(bee_type))
      end
    end
  end
end
