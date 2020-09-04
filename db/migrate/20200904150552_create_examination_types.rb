class CreateExaminationTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :examination_types do |t|
      t.string :kind

      t.timestamps
    end
  end
end
