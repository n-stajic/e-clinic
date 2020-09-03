class UpdatePatients < ActiveRecord::Migration[6.0]
  def change
    remove_column :patients, :street_address
    remove_column :patients, :city
    remove_column :patients, :country

    add_reference :patients, :address, index: true
  end
end
