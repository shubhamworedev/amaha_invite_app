require 'rails_helper'

RSpec.describe CustomerFilterService do
  let(:file) do
    StringIO.new <<~TXT
      {"user_id": 1, "name": "Near User", "latitude": "19.059", "longitude": "72.755"}
      {"user_id": 2, "name": "Far User", "latitude": "0", "longitude": "0"}
    TXT
  end

  subject { described_class.new(file) }

  it "returns all customers with all attributes" do
    result = subject.call
    filtered_result = result.map { |c| { user_id: c["user_id"], name: c["name"] } }

    expect(filtered_result).to eq([
      { user_id: 1, name: "Near User" }
    ])
  end
end
