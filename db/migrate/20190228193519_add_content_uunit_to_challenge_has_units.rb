class AddContentUunitToChallengeHasUnits < ActiveRecord::Migration[5.2]
  def change
    add_column :challenge_has_units, :content, :text
  end
end
