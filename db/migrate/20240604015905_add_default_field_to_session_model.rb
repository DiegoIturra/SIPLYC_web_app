class AddDefaultFieldToSessionModel < ActiveRecord::Migration[7.1]
  def change
    change_column_default :sessions, :state, 'incomplete'
  end
end
