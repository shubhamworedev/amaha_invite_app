require 'rails_helper'

RSpec.describe "Customers API", type: :request do
  it "returns filtered customers" do
    file = Tempfile.new('customers.txt')
    file.write('{"user_id": 1, "name": "Test User", "latitude": "19.05", "longitude": "72.76"}')
    file.rewind

    post "/api/v1/customers/upload", params: { customers_file: Rack::Test::UploadedFile.new(file) }
    expect(response).to have_http_status(:ok)
    expect(JSON.parse(response.body)["customers"].first["user_id"]).to eq(1)

    file.close
    file.unlink
  end
end
