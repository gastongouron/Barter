class AddUserIdToHelps < ActiveRecord::Migration
  def change
    add_reference :helps, :user, index: true
  end
end
