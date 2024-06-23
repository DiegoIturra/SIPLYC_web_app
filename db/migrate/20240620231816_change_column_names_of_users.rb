class ChangeColumnNamesOfUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :surname, :father_lastname
    rename_column :users, :second_surname, :mother_lastname
  end
end
