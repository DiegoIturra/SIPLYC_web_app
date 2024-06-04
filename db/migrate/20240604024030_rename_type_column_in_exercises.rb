class RenameTypeColumnInExercises < ActiveRecord::Migration[7.1]
  def change
    rename_column :exercises, :type, :category
  end
end
