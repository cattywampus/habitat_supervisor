require 'net/http'
require 'json'

module HabitatSupervisor
  module Connection
    def get(path, options = {})
      req = Net::HTTP::Get.new(path, options)
      response = http.request(req)
      JSON.parse(response.body)
    end

    def url
      @url ||= URI.parse(api_endpoint)
    end

    def http
      @http ||= Net::HTTP.new(url.host, url.port)
    end
  end
end
