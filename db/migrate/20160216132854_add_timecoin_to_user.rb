class AddTimecoinToUser < ActiveRecord::Migration
  def change
    add_column :users, :timecoin, :integer, default: 1
  end
end
