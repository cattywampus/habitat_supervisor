require "json"
require "bundler/setup"
require "habitat_supervisor"
require "webmock/rspec"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def hab_sup_url(url)
  return url if url =~ /^http/

  File.join(HabitatSupervisor.api_endpoint, url)
end

def stub_get(url, options = {}, &block)
  request = stub_request(:get, hab_sup_url(url))
  request = request.with(options) if options.keys.size > 0
  request.to_return(block.call)
end
