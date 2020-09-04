class AddDurationToPriceItem < ActiveRecord::Migration[6.0]
  def change
    add_column :price_items, :duration, :integer
  end
end
