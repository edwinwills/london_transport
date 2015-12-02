module LondonTransport
  @@app_key = nil
  @@app_id = nil

  class << self
    def app_key
      @@app_key
    end

    def app_key=(key)
      @@app_key = key
    end

    def app_id
      @@app_id
    end

    def app_id=(id)
      @@app_id = id
    end
  end
end

require 'oj'
require 'london_transport/base'
require 'london_transport/train'
require 'london_transport/tube'
require 'london_transport/bus'
