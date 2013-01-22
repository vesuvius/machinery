class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :machine_id

      t.timestamps
    end
  end
end
