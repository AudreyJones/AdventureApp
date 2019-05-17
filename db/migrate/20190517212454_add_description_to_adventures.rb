class AddDescriptionToAdventures < ActiveRecord::Migration[5.2]
  def change
    add_column :adventures, :description, :text
  end
end
