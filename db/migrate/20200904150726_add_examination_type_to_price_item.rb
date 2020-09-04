class AddExaminationTypeToPriceItem < ActiveRecord::Migration[6.0]
  def change
    add_reference :price_items, :examination_type, null: false, foreign_key: true
    remove_column :price_items, :kind
  end
end
