class CreateChallengeHasUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :challenge_has_units do |t|
      t.text :instruction
      t.references :challenge, foreign_key: true
      t.references :unit, foreign_key: true

      t.timestamps
    end
  end
end
