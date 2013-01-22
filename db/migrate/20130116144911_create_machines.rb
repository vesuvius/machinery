class CreateMachines < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.string :id_number
      t.string :stock_number
      t.integer :workshop_id
      t.integer :kind_id
      t.string :name
      t.string :initial_id
      t.string :make
      t.integer :country_id
      t.integer :year_of_production
      t.float :price

      t.timestamps
    end
  end
end
