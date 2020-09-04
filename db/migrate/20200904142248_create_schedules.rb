class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.references :doctor
      t.references :clinic
      t.json :schedule

      t.timestamps
    end
  end
end
