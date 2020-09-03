class CreatePriceLists < ActiveRecord::Migration[6.0]
  def change
    create_table :price_lists do |t|
      t.references :clinic, null: false, foreign_key: true
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
