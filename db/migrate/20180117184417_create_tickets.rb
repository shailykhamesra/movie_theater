class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.decimal :price
      t.references :showtime, index: true, foreign_key: true
      t.references :booking, index: true, foreign_key: true
    end
  end
end
