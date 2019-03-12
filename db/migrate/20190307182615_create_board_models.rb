class CreateBoardModels < ActiveRecord::Migration[5.2]
  def change
    create_table :board_models do |t|
      t.text :name

      t.timestamps
    end
  end
end
