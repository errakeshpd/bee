class ChangeLifespanToFloat < ActiveRecord::Migration[5.0]
  def change
    change_column :bees, :lifespan, :float
  end
end
