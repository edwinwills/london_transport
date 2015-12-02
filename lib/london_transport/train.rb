class LondonTransport::Train < LondonTransport::Base
  STOP_TYPES = [
    "NaptanRailStation"
  ]

  MODES = [
    'overground',
    'national-rail',
    'tflrail'
  ]
end
