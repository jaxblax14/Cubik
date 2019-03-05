class AddLinkVideoToChallengeHasUnits < ActiveRecord::Migration[5.2]
  def change
    add_column :challenge_has_units, :link_video, :text
  end
end
