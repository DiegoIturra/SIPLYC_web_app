class CreateStudentFiles < ActiveRecord::Migration[7.1]
  def change
    create_table :student_files do |t|
      t.string :mother_socioeconomic_level
      t.string :father_socioeconomic_level
      t.string :breastfeeding_period
      t.string :socieconomic_level
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
