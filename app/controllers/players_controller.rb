class PlayersController < ApplicationController
  def index
    @players = Player.all.as_json
  end

  def download_csv
    send_data(Player.to_csv(sort_params, filter_params), filename: "players-#{Date.today}.csv")
  end

  private
    def sort_params
      params.require(:sorted).permit(:attr, :desc)
    end

    def filter_params
      params.require(:filtered).permit(:attr, :prefix)
    end
end
