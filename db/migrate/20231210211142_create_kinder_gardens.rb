class CreateKinderGardens < ActiveRecord::Migration[7.1]
  def change
    create_table :kinder_gardens do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
