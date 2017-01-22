class RenameTypeToBeetypeToBees < ActiveRecord::Migration[5.0]
  def change
    rename_column :bees, :type, :category
  end
end
