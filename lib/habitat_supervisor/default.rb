require "habitat_supervisor/version"

module HabitatSupervisor
  module Default

    # Default API endpoint
    API_ENDPOINT = "http://localhost:9631".freeze

    # Default User Agent header string
    USER_AGENT = "Habitat Supervisor Ruby Gem #{HabitatSupervisor::VERSION}".freeze

    class << self

      # Configuration options
      # @return [Hash]
      def options
        Hash[HabitatSupervisor::Configurable.keys.map{|key| [key, send(key)]}]
      end

      # Default API endpoint from ENV or {API_ENDPOINT}
      # @return [String]
      def api_endpoint
        ENV['HAB_SUP_API_ENDPOINT'] || API_ENDPOINT
      end

      # Default User-Agent header string from ENV or {USER_AGENT}
      # @return [String]
      def user_agent
        ENV['HAB_SUP_USER_AGENT'] || USER_AGENT
      end

    end
  end
end
