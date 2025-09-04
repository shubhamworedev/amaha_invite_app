module Api
  module V1
    class CustomersController < ApplicationController
      # Upload and process customers file
      def upload
        file = params[:customers_file]
        return render json: { error: 'Missing customers_file param' }, status: :bad_request unless file.respond_to?(:read)

        # Use service to filter/process customers
        customer_service = CustomerFilterService.new(file)
        result = customer_service.call

        # Return only selected fields in response
        filtered_result = result.map { |c| { user_id: c["user_id"], name: c["name"] } }
        render json: { customers: filtered_result }, status: :ok
      rescue StandardError => e
        Rails.logger.error("Customers#upload failed: #{e.class} #{e.message}")
        render json: { error: e.message }, status: :unprocessable_entity
      end
    end
  end
end