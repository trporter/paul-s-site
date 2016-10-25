class CreatePaintings < ActiveRecord::Migration
  def change
    create_table :paintings do |t|
      t.string :title
      t.integer :year
      t.text :description
      t.string :dimentions

      t.timestamps null: false
    end
  end
end
