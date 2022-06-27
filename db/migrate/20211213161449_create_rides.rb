class CreateRides < ActiveRecord::Migration[6.0]
  def change
    create_table :rides do |t|
      t.string :pickup_location
      t.string :checkout_location
      t.integer :passengers, default: 1
      t.string :car_model
      t.string :car_brand
      t.integer :rental_rate
      t.boolean :status, default: true
      t.datetime :pickup_datetime

      t.timestamps
    end
  end
end
