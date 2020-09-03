class AddDiscountToAppointment < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :discount, :integer
  end
end
