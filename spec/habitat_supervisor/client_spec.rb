require 'spec_helper'

RSpec::describe HabitatSupervisor::Client do
  describe "module configuration" do
    before(:each) do
      HabitatSupervisor.configure do |config|
        HabitatSupervisor::Configurable.keys.each do |key|
          config.send("#{key}=", "Some #{key}")
        end
      end
    end

    it "inherits the module configuration" do
      client = HabitatSupervisor::Client.new
      HabitatSupervisor::Configurable.keys.each do |key|
        expect(client.instance_variable_get(:"@#{key}")).to eq("Some #{key}")
      end
    end

    describe "with class level configuration" do

      before do
        @opts = {
          api_endpoint: "http://habitat:1234/"
        }
      end

      it "overrides the module configuration" do
        client = HabitatSupervisor::Client.new(@opts)
        expect(client.api_endpoint).to eq("http://habitat:1234/")
      end
    end
  end
end
