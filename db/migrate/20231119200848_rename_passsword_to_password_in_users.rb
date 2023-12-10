class RenamePassswordToPasswordInUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :passsword, :password
  end
end
