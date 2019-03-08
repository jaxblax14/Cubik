class AddBoardModelToBoards < ActiveRecord::Migration[5.2]
  def change
    add_reference :boards, :board_model, foreign_key: true
  end
end
