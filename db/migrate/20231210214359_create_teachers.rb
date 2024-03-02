class CreateTeachers < ActiveRecord::Migration[7.1]
  def change
    create_table :teachers do |t|
      t.string :rut
      t.string :names
      t.string :father_lastname
      t.string :mother_lastname
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
