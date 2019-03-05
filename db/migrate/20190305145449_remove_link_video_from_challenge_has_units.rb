class RemoveLinkVideoFromChallengeHasUnits < ActiveRecord::Migration[5.2]
  def change
    remove_column :challenge_has_units, :link_video, :string
  end
end
