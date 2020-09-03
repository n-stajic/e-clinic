class CreateClinicDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :clinic_doctors do |t|
      t.references :clinic, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
