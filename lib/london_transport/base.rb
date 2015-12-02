class LondonTransport::Base

  API_ENDPOINT = "https://api.tfl.gov.uk/StopPoint"
  STOP_TYPES = []
  MODES = []

  def initialize(longitude:, latitude:, radius: 500)
    @longitude = longitude
    @latitude = latitude
    @radius = radius
  end

  def stations(limit = 3)
    distances = []
    nearest['stopPoints'][0..limit - 1].each do |station|
      distances << { station['commonName'] => station['distance'] }
    end

    distances
  end

  private
  def api_endpoint
    URI("#{API_ENDPOINT}?lat=#{@latitude}&lon=#{@longitude}&stopTypes=#{stop_types}&radius=#{@radius}&useStopPointHierarchy=True&returnLines=True&modes=#{modes}&app_id=#{LondonTransport.app_id}&app_key=#{LondonTransport.app_key}")
  end

  def stop_types
    @stop_types ||= self.class::STOP_TYPES.join(',')
  end

  def modes
    @modes ||= self.class::MODES.join(',')
  end

  def nearest
    Oj.load(Net::HTTP.get(api_endpoint))
  end

end
