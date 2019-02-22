class CreateProjectStates < ActiveRecord::Migration[5.2]
  def change
    create_table :project_states do |t|
      t.text :name

      t.timestamps
    end
  end
end
