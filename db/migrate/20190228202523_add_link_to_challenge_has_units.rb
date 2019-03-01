class AddLinkToChallengeHasUnits < ActiveRecord::Migration[5.2]
  def change
    add_column :challenge_has_units, :videolink, :text
  end
end
