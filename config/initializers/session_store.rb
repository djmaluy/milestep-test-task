Rails.application.config.session_store :cookie_store, 
  key: ENV["SECRET_KEY_BASE"], 
  same_site: ENV["SESSION_COOKIE_SAMESITE"], 
  secure: ENV['SESSION_COOKIE_SECURE']

