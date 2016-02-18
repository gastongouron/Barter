class CreateSwaps < ActiveRecord::Migration
  def change
    create_table :swaps do |t|
      t.string :name
      t.string :description
      t.string :location
      t.datetime  :start
      t.datetime  :end
      t.integer   :swapper_id
      t.integer   :barter_id
      t.integer   :bart_id
      t.string    :swapper_name

      t.timestamps null: false
    end
  end

  def up
    remove_column :swaps, :name
  end

  def down
    drop_table :swaps
  end
end
