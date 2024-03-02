class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :rut
      t.string :names
      t.string :father_lastname
      t.string :mother_lastname
      t.date :birthday
      t.string :gender
      t.string :group
      t.string :comments
      t.string :email
      t.string :password
      t.string :state
      t.references :kinder_garden, null: false, foreign_key: true
      t.references :age_range, null: false, foreign_key: true

      t.timestamps
    end
  end
end
