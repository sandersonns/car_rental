class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :brand, null: false
      t.string :model, null: false
      t.integer :year_of_production, null: false
      t.string :address, null: false
      t.float :price_per_day, null: false
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
