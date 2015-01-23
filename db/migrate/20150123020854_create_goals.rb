class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :name
      t.string :type
      t.integer :users_currently
      t.integer :users_ever
      t.integer :total_completions
      t.string :average_streak_currently
      t.string :average_before_breaking

      t.timestamps null: false
    end
  end
end
