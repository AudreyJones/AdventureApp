class CreateFranchises < ActiveRecord::Migration[5.2]
  def change
    create_table :franchises do |t|
      t.string :name
      t.string :no-test-framework

      t.timestamps
    end
  end
end
