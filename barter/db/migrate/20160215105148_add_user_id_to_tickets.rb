class AddUserIdToTickets < ActiveRecord::Migration
  def change
    add_reference :barts, :user, index: true
  end
end
