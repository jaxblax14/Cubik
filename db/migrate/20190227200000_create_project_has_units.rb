class CreateProjectHasUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :project_has_units do |t|
      t.references :projects, foreign_key: true
      t.references :units, foreign_key: true

      t.timestamps
    end
  end
end
