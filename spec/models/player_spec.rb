require "rails_helper"

RSpec.describe Player, :type => :model do
  context "requires all attributes to be present upon saving to database" do
    it "throws exception due to missing name" do
      attrs = {
        "team" => "JAX",
        "position" => "RB",
        "attempts_per_game" => 2,
        "attempts" => 2,
        "rushing_yds_total" => 7,
        "rushing_yds_per_attempt" => 3.5,
        "rushing_yds_per_game" => 7,
        "touch_down" => 0,
        "longest_rush" => "7",
        "first_down" => 0,
        "first_down_pct" => 0,
        "twenty_yards" => 0,
        "forth_yards" => 0,
        "fumbles" => 0,
      }
      expect {
        Player.create!(attrs)
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
