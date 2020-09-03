class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.timestamp :date
      t.references :clinic, null: false, foreign_key: true
      t.references :hall,   null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true
      t.references :price_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
