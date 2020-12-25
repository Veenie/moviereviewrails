Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github, ENV['KEY'], ENV['SECRET']
    #, {callback_path: '/auth/facebook/callback'}
  end