class CreateVacations < ActiveRecord::Migration[6.0]
  def change
    create_table :vacations do |t|
      t.references :doctor, null: false, foreign_key: true
      t.date :from
      t.date :to

      t.timestamps
    end
  end
end
