class LondonTransport::Combined < LondonTransport::Base
  private
  def stop_types
    @stop_types ||= combined_data(constant_name: 'STOP_TYPES').flatten.uniq.join(',')
  end

  def modes
    @modes ||= combined_data(constant_name: 'MODES').flatten.uniq.join(',')
  end

  def combined_data(constant_name:)
    LondonTransport::Base::AVAILABLE_MODES_OF_TRANSPORT.map do |transport|
      Module.const_get("LondonTransport::#{transport.capitalize}::#{constant_name}")
    end
  end
end
