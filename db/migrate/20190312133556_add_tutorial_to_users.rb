class AddTutorialToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :tutorial, :boolean
  end
end
