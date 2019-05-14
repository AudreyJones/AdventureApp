class CreateAdventures < ActiveRecord::Migration[5.2]
  def change
    create_table :adventures do |t|
      t.string :name
      t.string :location
      t.integer :franchise_id
      t.integer :villain_id
      t.integer :hero_id
      t.string :no-test-framework

      t.timestamps
    end
  end
end
