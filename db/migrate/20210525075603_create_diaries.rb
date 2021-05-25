class CreateDiaries < ActiveRecord::Migration[6.1]
  def change
    create_table :diaries do |t|
      t.string :title
      t.string :contents
      t.references :user, null: false, foreign_key: true
      t.string :is_deleted
      t.string :boolean

      t.timestamps
    end
  end
end
