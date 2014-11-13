class FixDescriptionForDatabase < ActiveRecord::Migration
  def change
    rename_column :databases, :desription, :description
  end
end
