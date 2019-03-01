class RemoveVideoLinkMigrationFromChallengeHasUnits < ActiveRecord::Migration[5.2]
  def change
    remove_column :challenge_has_units, :videolink, :string
  end
end
