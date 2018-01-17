class CreateShowtimes < ActiveRecord::Migration[5.1]
  def change
    create_table :showtimes do |t|
      t.time :timings
      t.references :movie, index: true, foreign_key: true
      t.references :screen, index: true, foreign_key: true
    end
  end
end
