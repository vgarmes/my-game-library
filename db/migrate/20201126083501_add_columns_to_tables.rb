class AddColumnsToTables < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :comment, :text
    rename_column :games, :additional_info, :edition
    add_column :platforms, :manufacturer, :string
  end
end
