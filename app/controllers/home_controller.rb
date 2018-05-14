class HomeController < ApplicationController
  require 'google/apis/youtube_v3'

  def index
    if current_user.present?
      @client = Google::Apis::YoutubeV3::LiveChatMessageAuthorDetails
      # @youtube = @client.discovered_api('youtube', 'v3')
      # @video_list =
    end
  end
end
