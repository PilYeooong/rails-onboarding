class CreateInvestedAssets < ActiveRecord::Migration[6.1]
  def change
    create_table :invested_assets do |t|
      t.string :amount
      t.string :string
      t.string :buy_price
      t.references :diary, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
