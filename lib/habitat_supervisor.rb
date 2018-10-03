require "habitat_supervisor/client"
require "habitat_supervisor/default"

module HabitatSupervisor
  class << self
    include HabitatSupervisor::Configurable

    # API client based on configured options {Configurable}
    #
    # @return [HabitatSupervisor::Client] API wrapper
    def client
      return @client if defined?(@client) && @client.same_options?(options)
      @client = HabitatSupervisor::Client.new(options)
    end

    private

    def respond_to_missing?(method_name, include_private=false)
      client.respond_to?(method_name, include_private)
    end

    def method_missing(method_name, *args, &block)
      if client.respond_to?(method_name)
        return client.send(method_name, *args, &block)
      end

      super
    end
  end
end

HabitatSupervisor.setup
