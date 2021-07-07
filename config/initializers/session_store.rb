# Rails.application.config.session_store :cookie_store, key: '_habit-helper', 
  #  domain: "milestep-frontend.herokuapp.com/"
  # same_site: ENV["SESSION_COOKIE_SAMESITE"], 
  # secure: ENV['SESSION_COOKIE_SECURE']
if Rails.env === 'production' 
    Rails.application.config.session_store :cookie_store, key: '_habit-helper', domain: :all
    Rails.application.config.session_store :cookie_store, key: '_habit-helper' 
end