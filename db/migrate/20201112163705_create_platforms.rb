class CreatePlatforms < ActiveRecord::Migration[6.0]
  def change
    create_table :platforms do |t|
      t.string :name

      t.timestamps
    end

    add_reference :games, :platform, foreign_key: true
  end
end
