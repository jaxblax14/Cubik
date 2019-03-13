class AddUsersIdToBoards < ActiveRecord::Migration[5.2]
  def change
    add_reference :boards, :users, foreign_key: true
  end
end
