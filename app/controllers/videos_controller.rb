class VideosController < ApplicationController

  def show
    if params['v'].present? && current_user
      @v = params['v']
      @v_info = youtube_client.list_videos('snippet,liveStreamingDetails,statistics', id: @v)
      @token = access_token
    end
  end
end
