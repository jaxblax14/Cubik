class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.text :code_board
      t.text :board_model
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
