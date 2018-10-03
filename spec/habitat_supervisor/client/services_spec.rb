require 'spec_helper'

RSpec.describe HabitatSupervisor::Client::Services do
  before do
    HabitatSupervisor.reset!
    @client = HabitatSupervisor::Client.new
  end

  describe ".services" do
    it "returns all services" do
      stub_get("/services") do
        {
          status: 200,
          body: [{ service_group: "postgresql.default" }].to_json,
          headers: {}
        }
      end
      services = @client.services
      expect(services).to be_kind_of Array
    end
  end

  describe ".service" do
    it "returns a service" do
      stub_get("/services/postgresql/default") do
        {
          status: 200,
          body: { service_group: "postgresql.default" }.to_json,
          headers: {}
        }
      end
      service = @client.service("postgresql.default")
      expect(service).to be_kind_of Hash
    end
  end

  describe ".service_config" do
    it "returns a service's configuration" do
      stub_get("/services/postgresql/default/config") do
        {
          status: 200,
          body: { superuser: { name: "admin" } }.to_json,
          headers: {}
        }
      end
      config = @client.service_config("postgresql.default")
      expect(config).to be_kind_of Hash
    end
  end

  describe ".service_health" do
    it "returns a service's health" do
      stub_get("/services/postgresql/default/health") do
        {
          status: 200,
          body: { status: "OK" }.to_json,
          headers: {}
        }
      end
      config = @client.service_health("postgresql.default")
      expect(config).to be_kind_of Hash
    end
  end
end
