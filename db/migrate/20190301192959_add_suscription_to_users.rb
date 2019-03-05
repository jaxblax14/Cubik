class AddSuscriptionToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :suscription, :boolean
  end
end
