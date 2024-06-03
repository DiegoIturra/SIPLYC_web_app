class CreateActivitySessions < ActiveRecord::Migration[7.1]
  def change
    create_table :activity_sessions do |t|
      t.references :activity, null: false, foreign_key: true
      t.references :session, null: false, foreign_key: true

      t.timestamps
    end
  end
end
