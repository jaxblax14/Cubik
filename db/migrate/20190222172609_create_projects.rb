class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.references :unit, foreign_key: true
      t.references :project_state, foreign_key: true
      t.references :challenge, foreign_key: true

      t.timestamps
    end
  end
end
