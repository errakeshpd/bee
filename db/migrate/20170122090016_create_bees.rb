class CreateBees < ActiveRecord::Migration[5.0]
  def change
    create_table :bees do |t|
      t.integer :type
      t.integer :lifespan
      t.integer :game_id

      t.timestamps
    end
  end
end
