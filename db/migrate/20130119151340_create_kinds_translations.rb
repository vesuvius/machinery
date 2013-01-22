class CreateKindsTranslations < ActiveRecord::Migration
  def up
      Kind.create_translation_table!({
        name: :string,
      }, {
        migrate_data: true
      })
    end

    def down
      Article.drop_translation_table! migrate_data: true
    end
end
