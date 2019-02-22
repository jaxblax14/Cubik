class CreateUnitHasQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :unit_has_questions do |t|
      t.references :unit, foreign_key: true
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
