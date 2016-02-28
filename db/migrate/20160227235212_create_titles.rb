class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |t|
      t.string :name
      t.string :image_path
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
