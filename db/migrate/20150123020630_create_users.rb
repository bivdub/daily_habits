class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :provider
      t.string :auth_hash
      t.string :oauth_token
      t.datetime :oath_expires_at
      t.string :phone
      t.boolean :text_alert
      t.boolean :email_alert
      t.boolean :negative
      t.boolean :positive
      t.string :zipcode

      t.timestamps null: false
    end
  end
end
