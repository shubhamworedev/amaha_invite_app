require 'rails_helper'

RSpec.describe DistanceCalculator do
  describe ".haversine" do
    it "calculates 0 km distance for same coordinates" do
      dist = described_class.haversine(19.0590317, 72.7553452, 19.0590317, 72.7553452)
      expect(dist).to be_within(0.001).of(0)
    end

    it "returns a positive number for different coordinates" do
      dist = described_class.haversine(19.0590317, 72.7553452, 20.0, 73.0)
      expect(dist).to be > 0
    end
  end
end