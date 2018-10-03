require 'spec_helper'

RSpec.describe HabitatSupervisor::Client::Services do
  before do
    HabitatSupervisor.reset!
    @client = HabitatSupervisor::Client.new
  end

  describe ".services" do
    it "returns all services" do
      services = @client.services
      expect(services).to be_kind_of Array
    end
  end

  describe ".service" do
    it "returns a service" do
      service = @client.service("postgresql.default")
      expect(service).to be_kind_of Hash
    end
  end

  describe ".service_config" do
    it "returns a service's configuration" do
      config = @client.service_config("postgresql.default")
      expect(config).to be_kind_of Hash
    end
  end

  describe ".service_health" do
    it "returns a service's health" do
      config = @client.service_config("postgresql.default")
      expect(config).to be_kind_of Hash
    end
  end
end
