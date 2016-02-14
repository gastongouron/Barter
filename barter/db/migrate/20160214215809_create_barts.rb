class CreateBarts < ActiveRecord::Migration
  def change
    create_table :barts do |t|
      t.string :name
      t.text :description
      t.references :swap, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
