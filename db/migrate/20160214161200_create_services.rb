class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :description
      t.string :location
      t.datetime  :start
      t.datetime  :end
      t.integer   :serviceper_id
      t.integer   :helper_id
      t.integer   :help_id
      t.string    :serviceper_name

      t.timestamps null: false
    end
  end

  def up
    remove_column :services, :name
  end

  def down
    drop_table :services
  end
end
