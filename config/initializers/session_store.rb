Rails.application.config.session_store :cookie_store, key: '_milestep_frontend_session', same_site: ENV["SESSION_COOKIE_SAMESITE"], 
secure: ENV['SESSION_COOKIE_SECURE'], domain: ENV["CLIENT_DOMAIN"], tld_length: 2
  
  
