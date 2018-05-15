class VideosController < ApplicationController
  def show
    if params['v'].present?
      @v = params['v']
    end
  end
end
