class CreatePics < ActiveRecord::Migration
  def change
    create_table :pics do |t|
      t.string :name
      t.text :desc
      t.references :album, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
