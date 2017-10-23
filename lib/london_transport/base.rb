class LondonTransport::Base
  API_ENDPOINT = "https://api.tfl.gov.uk/StopPoint"
  STOP_TYPES = []
  MODES = []
  AVAILABLE_MODES_OF_TRANSPORT = ['bus', 'train', 'tube']

  def initialize(longitude:, latitude:, radius: 500)
    @longitude = longitude
    @latitude = latitude
    @radius = radius
  end

  def stations(limit = 3)
    distances = []
    return distances unless nearest

    nearest['stopPoints'][0..limit - 1].each do |station|
      line = LondonTransport::Line.new(station['lineModeGroups'])

      distances << {
        station['commonName'] => {
          distance: BigDecimal.new(station['distance'].to_s).to_f.round(15),
          modes: self.class::MODES.any? ? self.class::MODES : station['modes'],
          lines: line.names
        }
      }
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
    Oj.load(::Net::HTTP.get(api_endpoint))
  end
end
