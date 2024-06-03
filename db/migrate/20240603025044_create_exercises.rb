class CreateExercises < ActiveRecord::Migration[7.1]
  def change
    create_table :exercises do |t|
      t.string :type
      t.string :date
      t.string :left_object
      t.string :right_object
      t.string :central_object
      t.string :max_time
      t.string :answer
      t.string :answer_time

      t.timestamps
    end
  end
end
