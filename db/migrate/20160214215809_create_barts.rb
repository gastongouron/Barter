class CreateBarts < ActiveRecord::Migration
  def change
    create_table :barts do |t|
      t.string :name
      t.integer :owner
      t.text :description
      t.boolean :chosen, default: false
      t.references :swap, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
