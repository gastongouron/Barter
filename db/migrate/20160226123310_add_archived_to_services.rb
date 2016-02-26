class AddArchivedToServices < ActiveRecord::Migration
  def change
    add_column :services, :archived, :boolean
  end
end
