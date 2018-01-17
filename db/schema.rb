# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180117184417) do

  create_table "bookings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "phone"
    t.string "creditcard"
    t.bigint "showtime_id"
    t.index ["showtime_id"], name: "index_bookings_on_showtime_id"
  end

  create_table "movies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
  end

  create_table "screens", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "number"
    t.bigint "theater_id"
    t.bigint "movie_id"
    t.index ["movie_id"], name: "index_screens_on_movie_id"
    t.index ["theater_id"], name: "index_screens_on_theater_id"
  end

  create_table "showtimes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.time "timings"
    t.bigint "movie_id"
    t.bigint "screen_id"
    t.index ["movie_id"], name: "index_showtimes_on_movie_id"
    t.index ["screen_id"], name: "index_showtimes_on_screen_id"
  end

  create_table "theaters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "address"
  end

  create_table "tickets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.decimal "price", precision: 10
    t.bigint "showtime_id"
    t.bigint "booking_id"
    t.index ["booking_id"], name: "index_tickets_on_booking_id"
    t.index ["showtime_id"], name: "index_tickets_on_showtime_id"
  end

  add_foreign_key "bookings", "showtimes"
  add_foreign_key "screens", "movies"
  add_foreign_key "screens", "theaters"
  add_foreign_key "showtimes", "movies"
  add_foreign_key "showtimes", "screens"
  add_foreign_key "tickets", "bookings"
  add_foreign_key "tickets", "showtimes"
end
