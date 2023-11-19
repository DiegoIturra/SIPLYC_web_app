class ChangeRoleReferenceNullInUsers < ActiveRecord::Migration[7.1]
  def change
    change_column_null :users, :role_id, true
  end
end
