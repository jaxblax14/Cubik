class RemoveBoardModelFromBoards < ActiveRecord::Migration[5.2]
  def change
    remove_column :boards, :board_model, :text
  end
end
