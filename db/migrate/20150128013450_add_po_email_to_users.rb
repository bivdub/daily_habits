class AddPoEmailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :po_email, :string
  end
end
