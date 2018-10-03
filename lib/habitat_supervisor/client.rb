require 'habitat_supervisor/configurable'
require 'habitat_supervisor/connection'
require 'habitat_supervisor/client/services'

module HabitatSupervisor
  class Client
    include HabitatSupervisor::Configurable
    include HabitatSupervisor::Connection
    include HabitatSupervisor::Client::Services

    def initialize(options = {})
      # Use options passed in, but fall back to module defaults
      HabitatSupervisor::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", options[key] || HabitatSupervisor.instance_variable_get(:"@#{key}"))
      end
    end
  end
end
