class CreateGardens < ActiveRecord::Migration[7.1]
  def change
    create_table :gardens do |t|
      t.string :kinder_garde
      t.string :name
      t.string :address
      t.string :phone
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
