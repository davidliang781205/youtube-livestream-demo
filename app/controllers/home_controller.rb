class HomeController < ApplicationController
  require 'google/apis/youtube_v3'
  require 'google/api_client/client_secrets.rb'

  def index
    if current_user.present?
      @res = youtube_client.list_searches(:snippet, q: "gaming", event_type: "live", max_results: "25", type: "video")
    end
  end
end
