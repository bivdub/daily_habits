class CreateAwardsUsers < ActiveRecord::Migration
  def change
    create_table :awards_users do |t|
      t.references :award, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :awards_users, :awards
    add_foreign_key :awards_users, :users
  end
end
