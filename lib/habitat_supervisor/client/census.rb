module HabitatSupervisor
  class Client
    module Census
      def census(options = {})
        get "/census", options
      end
    end
  end
end
