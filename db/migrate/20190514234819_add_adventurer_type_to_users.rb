class AddAdventurerTypeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :adventurer_type, :boolean
  end
end
