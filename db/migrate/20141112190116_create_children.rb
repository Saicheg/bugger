class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.integer :height
      t.date :birthday
      t.string :name
      t.references :database, index: true

      t.timestamps null: false
    end
  end
end
