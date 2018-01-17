class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.string :name
      t.string :phone
      t.string :creditcard
      t.references :showtime, index: true, foreign_key: true
    end
  end
end
