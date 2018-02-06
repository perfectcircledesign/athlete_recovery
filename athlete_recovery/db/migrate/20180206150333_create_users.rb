class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :id_number
      t.string :email
      t.string :phone
      t.integer :resting_heart_rate
      t.boolean :blood_gas_test

      t.timestamps
    end
  end
end
