# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'open-uri'
require 'json'
require 'pp'

Player.delete_all

begin
  url = "https://raw.githubusercontent.com/paulcsli/nfl-rushing/master/db/rushing.json"
  file = open(url)
  players = JSON.load(file)
rescue => exception
  puts "Invalid URL or invalid json file"
else
  data = []
  players.each do |player|
    pp player
    object = {
      "name" => player["Player"], 
      "team" => player["Team"], 
      "position" => player["Pos"], 
      "attempts_per_game" => player["Att/G"], 
      "attempts" => player["Att"], 
      "rushing_yds_total" => player["Yds"], 
      "rushing_yds_per_attempt" => player["Avg"], 
      "rushing_yds_per_game" => player["Yds/G"], 
      "touch_down" => player["TD"], 
      "longest_rush" => player["Lng"], 
      "first_down" => player["1st"], 
      "first_down_pct" => player["1st%"], 
      "twenty_yards" => player["20+"], 
      "forth_yards" => player["40+"], 
      "fumbles" => player["FUM"]
    }
    data << object
  end
  Player.create!(data)
end
