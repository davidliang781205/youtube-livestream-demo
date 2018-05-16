class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  require 'google/apis/youtube_v3'
  require 'google/api_client/client_secrets.rb'

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def youtube_client
    if current_user
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

      client
    else
      puts "Unauthorized"
    end
  end

  def access_token
    if current_user
      current_user.oauth_token
    end
  end

end