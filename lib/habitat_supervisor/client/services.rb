module HabitatSupervisor
  class Client
    module Services
      def services(options = {})
        get "/services", options
      end

      def service(name, options = {})
        service_name, service_group = parse_service_name(name)
        get "/services/#{service_name}/#{service_group}", options
      end

      def service_config(name, options = {})
        service_name, service_group = parse_service_name(name)
        get "/services/#{service_name}/#{service_group}/config", options
      end

      def service_health(name, option = {})
        service_name, service_group = parse_service_name(name)
        get "/services/#{service_name}/#{service_group}/health", options
      end

      private

      def parse_service_name(name)
        name.split(".")
      end
    end
  end
end
