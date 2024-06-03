class CreateTablets < ActiveRecord::Migration[7.1]
  def change
    create_table :tablets do |t|
      t.string :model
      t.string :state

      t.timestamps
    end
  end
end
