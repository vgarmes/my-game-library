class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :title
      t.boolean :in_collection, default: false
      t.boolean :completed, default: false
      t.text :additional_info
      t.date :release_date
      t.date :completed_date
      t.date :buy_date
      t.float :buy_price
      t.integer :genre_id, foreign_key: true
      t.integer :developer_id, foreign_key: true

      t.timestamps
    end
  end
end
