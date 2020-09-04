class CreateDoctorExaminationTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :doctor_examination_types do |t|
      t.references :doctor, null: false, foreign_key: true
      t.references :examination_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
