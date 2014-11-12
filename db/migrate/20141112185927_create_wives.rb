class CreateWives < ActiveRecord::Migration
  def change
    create_table :wives do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.date :birthday
      t.references :database, index: true

      t.timestamps null: false
    end
  end
end
