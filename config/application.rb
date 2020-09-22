require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Hospital
  class Application < Rails::Application
    config.load_defaults 5.2

    config.generators do |g|
      g.assets  false
      g.helper false
      g.stylesheets false
      g.template_engine :slim
    end

    config.active_record.default_timezone = :local
    config.time_zone = 'Mexico City'
  end
end
