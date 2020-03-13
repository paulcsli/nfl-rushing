class PlayersController < ApplicationController
  def index
    @players = Player.all.as_json
  end
end
