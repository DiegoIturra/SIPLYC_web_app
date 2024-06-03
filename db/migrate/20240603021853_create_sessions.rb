class CreateSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :sessions do |t|
      t.date :date_session
      t.time :hour
      t.integer :session_number
      t.string :state
      t.time :duration
      t.integer :apk_version
      t.string :comments

      t.timestamps
    end
  end
end
