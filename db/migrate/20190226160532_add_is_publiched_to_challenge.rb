class AddIsPublichedToChallenge < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :is_published, :boolean
  end
end
