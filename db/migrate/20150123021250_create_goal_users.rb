class CreateGoalUsers < ActiveRecord::Migration
  def change
    create_table :goal_users do |t|
      t.references :goal, index: true
      t.references :user, index: true
      t.integer :streak_completed
      t.integer :streak_failed
      t.boolean :completed_today
      t.integer :max_streak
      t.integer :max_failed
      t.boolean :active

      t.timestamps null: false
    end
    add_foreign_key :goal_users, :goals
    add_foreign_key :goal_users, :users
  end
end
