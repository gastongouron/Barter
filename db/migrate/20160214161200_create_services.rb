class CreateServices < ActiveRecord::Migration
  def change
    create_table  :services do |t|
      t.string    :name
      t.string    :description
      t.string    :location
      t.string    :servicer_name
      t.integer   :servicer_id
      t.integer   :helper_id
      t.integer   :help_id
      t.datetime  :start
      t.datetime  :end
      t.boolean   :credited, default: false

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
