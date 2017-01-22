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
end
