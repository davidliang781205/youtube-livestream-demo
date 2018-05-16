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
      client = Google::Apis::YoutubeV3::YouTubeService.new
      authorization = Signet::OAuth2::Client.new(access_token: current_user.oauth_token)
      authorization.expires_in = 1.week.from_now
      client.authorization = authorization

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