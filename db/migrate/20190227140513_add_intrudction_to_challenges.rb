class AddIntrudctionToChallenges < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :introduction, :text
  end
end
