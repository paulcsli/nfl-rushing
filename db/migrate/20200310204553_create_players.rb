class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :team
      t.string :position
      
      t.integer :attempts_per_game #Rushing Attempts Per Game Average
      t.integer :attempts #Rushing Attempts
      
      t.string :rushing_yds_total #Total Rushing Yards
      t.integer :rushing_yds_per_attempt #Rushing Average Yards Per Attempt
      t.integer :rushing_yds_per_game #Rushing Yards Per Game
      
      t.integer :touch_down #Total Rushing Touchdowns
      t.string :longest_rush #Longest Rush -- a T represents a touchdown occurred
      t.integer :first_down #Rushing First Downs
      t.integer :first_down_pct #Rushing First Down Percentage
      t.integer :twenty_yards #Rushing 20+ Yards Each
      t.integer :forth_yards #Rushing 40+ Yards Each
      t.integer :fumbles #Rushing Fumbles

      t.timestamps
    end
  end
end
