module LondonTransport
  class << self
    attr_accessor :app_id, :app_key
  end
end

require 'net/http'
require 'oj'
require 'london_transport/version'
require 'london_transport/base'
require 'london_transport/line'
require 'london_transport/combined'
require 'london_transport/train'
require 'london_transport/tube'
require 'london_transport/bus'
