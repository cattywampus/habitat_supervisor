module HabitatSupervisor
  class Client
    module Butterfly
      def butterfly(options = {})
        get "/butterfly", options
      end
    end
  end
end
