class AddDefaultFieldToTabletModel < ActiveRecord::Migration[7.1]
  def change
    change_column_default :tablets, :state, 'active'
  end
end
