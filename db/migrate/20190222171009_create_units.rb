class CreateUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :units do |t|
      t.text :name
      t.integer :index_order
      t.text :content
      t.text :link_video

      t.timestamps
    end
  end
end
