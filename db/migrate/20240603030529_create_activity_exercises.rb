class CreateActivityExercises < ActiveRecord::Migration[7.1]
  def change
    create_table :activity_exercises do |t|
      t.references :activity, null: false, foreign_key: true
      t.references :exercise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
