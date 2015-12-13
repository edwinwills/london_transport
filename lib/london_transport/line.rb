class LondonTransport::Line
  def initialize(line_details)
    @line_details = line_details || []
  end

  def names
    @names ||= @line_details.any? ? @line_details.last['lineIdentifier'] : []
  end
end
