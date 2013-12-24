class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :county_code
      t.string :phone
      t.string :employees
      t.string :employee_code
      t.string :naics
      t.string :ownership
      t.integer :company_id

      t.timestamps
    end
  end
end
