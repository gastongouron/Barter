class CreateHelps < ActiveRecord::Migration
  def change
    create_table :helps do |t|
      t.string :name
      t.integer :owner
      t.text :description
      t.boolean :chosen, default: false
      t.references :service, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
