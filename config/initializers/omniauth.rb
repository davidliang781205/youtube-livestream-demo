OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_SECRET"],
  {
    scope: 'email, profile, plus.me, http://gdata.youtube.com, https://www.googleapis.com/auth/youtube.force-ssl, https://www.googleapis.com/auth/youtube, https://www.googleapis.com/auth/youtube.readonly',
    prompt: 'select_account',
    image_aspect_ratio: 'square',
    image_size: 50, skip_jwt: true
  }
end