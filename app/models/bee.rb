class Bee < ApplicationRecord
  belongs_to :game

  enum category: [:drone, :worker, :queen]

  def self.get_type(name)
    value = if name == 'drone'
      0
    elsif name == 'worker'
      1
    else
      2
    end
    return value
  end

  def self.life_span(name)
    value = if name == 'drone'
      50
    elsif name == 'worker'
      75
    else
      100
    end
    return value
  end

  def progressbar(name)
    value = if name == 'drone'
      50
    elsif name == 'worker'
      75
    else
      100
    end

    progres = (lifespan/value)*100
    return progres
  end

  def reduce_life
    value = if category == 'drone'
      12
    elsif category == 'worker'
      10
    else
      8
    end

    prog = if category == 'drone'
      50
    elsif category == 'worker'
      75
    else
      100
    end

    self.lifespan = self.lifespan - value
    self.save
    progres = (self.lifespan*100/prog)
    queen = false
    is_queen_died = false

    qprogres = (self.game.bees.find_by(category: 'queen').lifespan*100/100)
    is_queen_died = qprogres <= 0


    return {lifespan: self.lifespan,
      value: value, progress: progres,
      id: "prog_#{self.id}",
      category: category,
      is_queen: queen,
      is_queen_died: is_queen_died,
      is_died: progres <= 0,
      is_all_died: self.game.bees.pluck(:lifespan)
    }
  end
end
