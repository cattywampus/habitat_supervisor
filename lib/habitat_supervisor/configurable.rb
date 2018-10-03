module HabitatSupervisor
  module Configurable
    attr_writer :api_endpoint

    class << self

      def keys
        @keys ||= [
          :api_endpoint
        ]
      end

    end

    def configure
      yield(self)
    end

    # Reset configuration options to default values
    def reset!
      HabitatSupervisor::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", HabitatSupervisor::Default.options[key])
      end
      self
    end
    alias setup reset!

    def api_endpoint
      File.join(@api_endpoint, "")
    end

    private


    def options
      Hash[HabitatSupervisor::Configurable.keys.map{|key| [key, instance_variable_get(:"@#{key}")]}]
    end
  end
end
