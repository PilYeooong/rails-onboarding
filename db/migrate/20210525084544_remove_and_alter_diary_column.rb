class RemoveAndAlterDiaryColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :diaries, :boolean
  end
end
