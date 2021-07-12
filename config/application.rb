require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MilestepTestTask
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    # config.middleware.use ActionDispatch::Cookies
    # config.middleware.use ActionDispatch::Session::CookieStore
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    config.hosts << "milestep-test-task-backend.herokuapp.com"
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.action_mailer.default_url_options = { host: 'https://milestep-test-task-backend.herokuapp.com' }
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.perform_deliveries = true
    config.action_mailer.smtp_settings = {
      :user_name => ENV['GMAIL_LOGIN'],
      :password => ENV['GMAIL_PASSWORD'],
      :domain => 'milestep-test-task-backend.herokuapp.com',
      :address => 'smtp.gmail.com',
      :port => 587,
      :authentication => :plain,
      :enable_starttls_auto => true
    }
    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    # config.middleware.use ActionDispatch::Cookies
   
    # config.middleware.use ActionDispatch::Cookies
    # config.middleware.use ActionDispatch::Session::CookieStore,
    #          key: '_cookie_name', path: '/', same_site: :none, secure: true
    # config.middleware.insert_after ActionDispatch::Cookies, ActionDispatch::Session::CookieStore, 
    # :key => ENV["SECRET_KEY_BASE"], same_site: :none, secure: :true, expire_after: 14.days, httponly: true


    config.before_configuration do
    env_file = File.join(Rails.root, 'config', 'local_env.yml')
    YAML.load(File.open(env_file)).each do |key, value|
    ENV[key.to_s] = value
  end if File.exists?(env_file)
end
  end
end
