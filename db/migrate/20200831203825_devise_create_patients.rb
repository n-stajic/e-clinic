# frozen_string_literal: true

class DeviseCreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      ## Database authenticatable
      t.string :email,               null: false, default: ""
      t.string :encrypted_password,  null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Non devise fields
      t.boolean :approved, null: false, default: false

      t.string :first_name
      t.string :last_name
      t.string :street_address
      t.string :city
      t.string :country
      t.string :phone_number
      t.string :jmbg


      t.timestamps null: false
    end

    add_index :patients, :email,                unique: true
    add_index :patients, :reset_password_token, unique: true
  end
end
