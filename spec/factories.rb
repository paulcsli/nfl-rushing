FactoryBot.define do
  factory :player do
    name { "Joe Banyard" }
    team { "JAX" }
    position { "RB" }
    attempts_per_game { 2 }
    attempts { 2 }
    rushing_yds_total { "7" }
    rushing_yds_per_attempt { 3 }
    rushing_yds_per_game { 7 }
    touch_down { 0 }
    longest_rush { "7" }
    first_down { 0 }
    first_down_pct { 0 }
    twenty_yards { 0 }
    forth_yards { 0 }
    fumbles { 0 }
  end
end
