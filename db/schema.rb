# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_14_234900) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "team"
    t.string "position"
    t.integer "attempts_per_game"
    t.integer "attempts"
    t.string "rushing_yds_total"
    t.integer "rushing_yds_per_attempt"
    t.integer "rushing_yds_per_game"
    t.integer "touch_down"
    t.string "longest_rush"
    t.integer "first_down"
    t.integer "first_down_pct"
    t.integer "twenty_yards"
    t.integer "forth_yards"
    t.integer "fumbles"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["longest_rush"], name: "index_players_on_longest_rush"
    t.index ["name"], name: "index_players_on_name"
    t.index ["rushing_yds_total"], name: "index_players_on_rushing_yds_total"
    t.index ["touch_down"], name: "index_players_on_touch_down"
  end

end
