require 'swagger_helper'

RSpec.describe 'api/v1/customers', type: :request do
  path '/api/v1/customers/upload' do
    post 'Upload customer file' do
      tags 'Customers'
      consumes 'multipart/form-data'

      parameter name: :customers_file,
                in: :formData,
                schema: {
                  type: :string,
                  format: :binary
                },
                required: true,
                description: 'Customers file (JSON lines format)'

      response '200', 'customers filtered' do
        let(:customers_file) { Rack::Test::UploadedFile.new('spec/fixtures/customers.txt', 'text/plain') }
        run_test!
      end

      response '400', 'file missing' do
        let(:customers_file) { nil }
        run_test!
      end
    end
  end
end
