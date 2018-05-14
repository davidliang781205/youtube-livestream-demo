class HomeController < ApplicationController
  require 'google/apis/youtube_v3'

  def index
    if current_user.present?
      Youtube = Google::Apis::YoutubeV3
      service = Youtube::YouTubeService.new
      @token = current_user.oauth_token
      # @video_list =
    end
  end
end
