require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AppointmentManage
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # config.i18n.default_locale = :'zh-CN'
    #
    # 配置默认ID使用UUID代替INT
    config.generators do |g|
      g.orm :active_record, primary_key_type: :uuid
    end

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # 配置北京时区
    config.time_zone = "Beijing"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
