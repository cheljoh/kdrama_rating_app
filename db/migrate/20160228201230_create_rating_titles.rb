class CreateRatingTitles < ActiveRecord::Migration
  def change
    create_table :rating_titles do |t|
      t.references :rating, index: true, foreign_key: true
      t.references :title, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
