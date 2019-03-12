class AddIsPublicToChallenges < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :is_public, :boolean
    add_reference :challenges, :users, foreign_key: true
  end
end
