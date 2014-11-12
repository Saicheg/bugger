class CreateDatabases < ActiveRecord::Migration
  def change
    create_table :databases do |t|
      t.string :desription
      t.date :mariage_date

      t.timestamps null: false
    end
  end
end
