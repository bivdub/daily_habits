class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.string :name
      t.string :type
      t.string :image_url
      t.integer :total_completions

      t.timestamps null: false
    end
  end
end
