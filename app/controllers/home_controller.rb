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
      # client.authorization = Signet::OAuth2::Client.new(
      #   :authorization_uri => 'https://accounts.google.com/o/oauth2/auth',
      #   :token_credential_uri =>  'https://www.googleapis.com/oauth2/v3/token',
      #   :client_id => ENV["GOOGLE_CLIENT_ID"],
      #   :client_secret => ENV["GOOGLE_SECRET"],
      #   :scope => 'email profile plus.me http://gdata.youtube.com https://www.googleapis.com/auth/youtube.force-ssl https://www.googleapis.com/auth/youtube https://www.googleapis.com/auth/youtube.readonly',
      #   :redirect_uri => 'http://localhost:3000/oauth'
      # )
      # client = Google::APIClient.new(
      #   :application_name => $PROGRAM_NAME,
      #   :application_version => '1.0.0'
      #   )
      # client.authorization.fetch_access_token!
      # @youtube = client.discovered_api(YOUTUBE_API_SERVICE_NAME, YOUTUBE_API_VERSION)
      @res = client.list_searches(:snippet, q: "gaming", event_type: "live", max_results: "50", type: "video")
    end
  end
end
