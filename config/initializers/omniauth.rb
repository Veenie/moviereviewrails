Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github, ENV['KEY'], ENV['SECRET'], scope: 'user'
    #, {callback_path: '/auth/facebook/callback'}
  end