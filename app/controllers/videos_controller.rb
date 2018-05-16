class VideosController < ApplicationController

  def show
    if params['v'].present? && current_user
      @v = params['v']
      @v_info = youtube_client.list_videos('snippet,liveStreamingDetails,statistics', id: @v)
      # @v_chat = youtube_client.list_live_chat_messages(@v_info.items.first.live_streaming_details.active_live_chat_id, 'snippet,authorDetails')
      @token = access_token
    end
  end
end
