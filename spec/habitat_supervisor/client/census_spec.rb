require 'spec_helper'

RSpec.describe HabitatSupervisor::Client::Census do
  before do
    HabitatSupervisor.reset!
    @client = HabitatSupervisor::Client.new
  end

  describe '.census' do
    it 'returns the supervisor census data' do
      stub_get("/census") do
        {
          status: 200,
          body: { changed: false, census_groups: {} }.to_json,
          headers: {}
        }
      end
      census = @client.census
      expect(census).to be_kind_of Hash
    end
  end
end
