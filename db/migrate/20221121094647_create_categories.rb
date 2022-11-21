class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false, limit: 250
      t.string :icon, null: false

      t.timestamps
    end
  end
end
