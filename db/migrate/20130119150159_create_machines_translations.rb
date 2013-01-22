class CreateMachinesTranslations < ActiveRecord::Migration
  def up
      Machine.create_translation_table!({
        id_number: :string,
        stock_number: :string,
        name: :string,
        initial_id: :string,
        make: :string
      }, {
        migrate_data: true
      })
    end

    def down
      Article.drop_translation_table! migrate_data: true
    end
end
