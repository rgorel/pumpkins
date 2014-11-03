class CreatePumpkins < ActiveRecord::Migration
  def change
    create_table :pumpkins do |t|
      t.string :name
      t.integer :weight
      t.string :softness
      t.integer :farm_id

      t.timestamps
    end
  end
end
