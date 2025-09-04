class CustomerFilterService
  MUMBAI_LAT = 19.0590317
  MUMBAI_LON = 72.7553452
  MAX_DISTANCE_KM = 100

  def initialize(file)
    @file = file
  end

  def call
    customers = []

    # Read each line from file and parse as JSON
    @file.read.each_line do |line|
      customer = JSON.parse(line)

      # Calculate distance from Mumbai coordinates
      distance = DistanceCalculator.haversine(
        MUMBAI_LAT, MUMBAI_LON,
        customer["latitude"].to_f, customer["longitude"].to_f
      )

      # Keep only customers within MAX_DISTANCE_KM
      if distance <= MAX_DISTANCE_KM
        customers << customer
      end
    end

    # Return customers sorted by user_id
    customers.sort_by { |c| c[:user_id] }
  end
end