class CreateAdventures < ActiveRecord::Migration[5.2]
  def change
    create_table :adventures do |t|
      t.string :name
      t.string :location
      t.integer :franchise_id
      t.integer :villain_id
      t.integer :user_id

      t.timestamps
    end
  end
end
