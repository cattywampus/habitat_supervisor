RSpec.describe HabitatSupervisor do
  before do
    HabitatSupervisor.reset!
  end

  after do
    HabitatSupervisor.reset!
  end

  it "has a version number" do
    expect(HabitatSupervisor::VERSION).not_to be nil
  end

  it "sets defaults" do
    HabitatSupervisor::Configurable.keys.each do |key|
      expect(HabitatSupervisor.instance_variable_get(:"@#{key}")).to eq(HabitatSupervisor::Default.send(key))
    end
  end

  describe ".configure" do
    HabitatSupervisor::Configurable.keys.each do |key|
      it "sets the #{key.to_s.gsub('_', ' ')}" do
        HabitatSupervisor.configure do |config|
          config.send("#{key}=", key)
        end
        expect(HabitatSupervisor.instance_variable_get(:"@#{key}")).to eq(key)
      end
    end
  end
end
