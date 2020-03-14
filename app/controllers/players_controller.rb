class PlayersController < ApplicationController
  def index
    @players = Player.all.as_json
  end

  def download_csv
    send_data(
      Player.to_csv(sort_params, filter_params),
      filename: "players-#{Date.today}.csv"
    )
  end

  private
    def sort_params
      permitted = params.require(:sorted).permit(:attr_name, :desc).to_hash.symbolize_keys
      # ActiveController Parameter casts boolean as strings
      permitted[:desc] = permitted[:desc] != 'false'
      permitted
    end

    def filter_params
      params.require(:filtered).permit(:attr_name, :search_value).to_hash.symbolize_keys
    end
end
