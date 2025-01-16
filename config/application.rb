require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module IceCreamApi
  class Application < Rails::Application
    
    config.load_defaults 7.2
    config.autoload_lib(ignore: %w[assets tasks])

    config.api_only = true
    config.autoload_paths << "#{config.root}/app/filters"

  end
end
