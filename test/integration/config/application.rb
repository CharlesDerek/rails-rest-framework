require_relative 'boot'
require 'uri'

# require 'rails/all'
require "rails"
[
  'active_record/railtie',
  #'active_storage/engine',
  'action_controller/railtie',
  'action_view/railtie',
  #'action_mailer/railtie',
  'active_job/railtie',
  #'action_cable/engine',
  #'action_mailbox/engine',
  #'action_text/engine',
  'rails/test_unit/railtie',
  'sprockets/railtie',
].each do |railtie|
  require railtie
end

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

class Application < Rails::Application
  config.load_defaults 6.0

  config.eager_load = false
  config.action_dispatch.show_exceptions = false
  config.consider_all_requests_local = true
  config.action_controller.allow_forgery_protection = false
  config.serve_static_files = true
  config.assets.debug = false
  config.assets.check_precompiled_asset = false

  config.session_store :cookie_store, :key => '_session'
  config.secret_token = 'a_test_token'
  config.secret_key_base = 'a_test_secret'

  config.logger = Logger.new($stdout)
  config.log_level = :warn
end
