OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '1060325641568-ju41q64e6bkvd1has29nbj1iv681sunh.apps.googleusercontent.com', '4kgQtRHKu3eXsepHTUDxYRVM',
  {
    scope: 'email, profile, plus.me, http://gdata.youtube.com',
    prompt: 'select_account',
    image_aspect_ratio: 'square',
    image_size: 50
  }
end