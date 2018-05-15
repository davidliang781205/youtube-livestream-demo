class HomeController < ApplicationController
  require 'google/apis/youtube_v3'
  require 'google/api_client/client_secrets.rb'
  # require 'google/api_client'
  YOUTUBE_SCOPE = 'https://www.googleapis.com/auth/youtube'
  YOUTUBE_API_SERVICE_NAME = 'youtube'
  YOUTUBE_API_VERSION = 'v3'

  def index
    if current_user.present?
      secrets = Google::APIClient::ClientSecrets.new(
        {
          "web" =>
            {
              "access_token" => current_user.oauth_token,
              "refresh_token" => current_user.refresh_token,
              "client_id" => ENV["GOOGLE_CLIENT_ID"],
              "client_secret" => ENV["GOOGLE_SECRET"]
            }
        }
      )
      client = Google::Apis::YoutubeV3::YouTubeService.new
      client.authorization = secrets.to_authorization
      @res = client.list_searches(:snippet, q: "esports", event_type: "live", max_results: "5", type: "video")
      # @res = client.list_live_streams(:snippet, id: "")

    end
  end
end
