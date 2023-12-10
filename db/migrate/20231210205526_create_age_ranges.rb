class CreateAgeRanges < ActiveRecord::Migration[7.1]
  def change
    create_table :age_ranges do |t|
      t.string :name
      t.integer :min_age
      t.integer :max_age

      t.timestamps
    end
  end
end
