class CreateHalls < ActiveRecord::Migration[6.0]
  def change
    create_table :halls do |t|
      t.references :clinic, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
