class AddForeingKeysToSessionModel < ActiveRecord::Migration[7.1]
  def change
    add_reference :sessions, :teacher, foreign_key: true
    add_reference :sessions, :student, foreign_key: true
    add_reference :sessions, :tablet, foreign_key: true
  end
end
