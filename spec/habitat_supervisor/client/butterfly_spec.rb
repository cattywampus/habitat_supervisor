require "spec_helper"

RSpec.describe HabitatSupervisor::Client::Butterfly do
  before do
    HabitatSupervisor.reset!
    @client = HabitatSupervisor::Client.new
  end

  describe ".butterfly" do
    it "returns the habitat supervisor butterfly debug output" do
      stub_get("/butterfly") do
        {
          status: 200,
          body: { member: {}, service: {} }.to_json,
          headers: {}
        }
      end
      butterfly = @client.butterfly
      expect(butterfly).to be_kind_of Hash
    end
  end
end
