class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :family
      t.string :email
      t.string :encrypted_password
      t.string :salt

      t.timestamps
    end
  end
end
