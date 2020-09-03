class AddFastToAppointments < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :fast, :boolean, default: false
  end
end
