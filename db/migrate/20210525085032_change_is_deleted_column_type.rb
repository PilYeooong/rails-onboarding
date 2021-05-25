class ChangeIsDeletedColumnType < ActiveRecord::Migration[6.1]
  def change
    remove_column :diaries, :is_deleted, :string
    add_column :diaries, :is_deleted, :boolean, :default => false
  end
end
