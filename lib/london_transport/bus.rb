class LondonTransport::Bus < LondonTransport::Base
  STOP_TYPES = [
    "NaptanPublicBusCoachTram",
    "NaptanBusCoachStation"
  ]

  MODES = [
    'bus'
  ]
end
