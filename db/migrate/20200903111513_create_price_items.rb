class CreatePriceItems < ActiveRecord::Migration[6.0]
  def change
    create_table :price_items do |t|
      t.references :price_list, null: false, foreign_key: true
      t.string :kind
      t.float :price

      t.timestamps
    end
  end
end
