class ChangeAwardColumn < ActiveRecord::Migration
  def change
    rename_column :awards, :type, :desc
  end
end
