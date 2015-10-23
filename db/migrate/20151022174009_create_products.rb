class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, unique: true
      t.text :description

      t.timestamps
    end
  end
end
