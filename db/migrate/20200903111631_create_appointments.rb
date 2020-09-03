class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.references :clinic,     null: false, foreign_key: true
      t.references :hall,       null: false, foreign_key: true
      t.references :doctor,     null: false, foreign_key: true
      t.references :patient,    null: true,  foreign_key: true
      t.references :price_item, null: false, foreign_key: true
      t.timestamp  :date,       null: false
      t.integer    :duration

      t.timestamps
    end
  end
end
