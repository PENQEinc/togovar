require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
# require "active_record/railtie"
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'action_cable/engine'
require 'sprockets/railtie'
# require "rails/test_unit/railtie"
require 'elasticsearch/rails/instrumentation'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TogoVar
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Don't generate system test files.
    config.generators.system_tests = nil

    console do
      Rails.logger = Logger.new(STDOUT)

      require 'togo_var'
    end

    config.paths.add File.join('app', 'utils'), eager_load: true

    config.public_dir = ENV.fetch('TOGOVAR_PUBLIC_DIR') { nil }

    config.elasticsearch = config_for(:elasticsearch)
    config.endpoint = config_for(:endpoint)
    config.gtm = config_for(:google_tag_manager)
    config.virtuoso = config_for(:virtuoso)
  end
end
