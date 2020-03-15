class AddIndexToPlayer < ActiveRecord::Migration[6.0]
  def change
    add_index :players, :touch_down
    add_index :players, :rushing_yds_total
    add_index :players, :longest_rush
    add_index :players, :name
  end
end
