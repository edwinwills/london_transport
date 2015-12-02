require 'spec_helper'

RSpec.describe LondonTransport::Train do
  subject { LondonTransport::Train.new(longitude: -0.1440493, latitude: 51.5152117) }

  describe '#stations' do
    it 'returns 0 stations' do
      VCR.use_cassette("train/stations") do
        expect(subject.stations.count).to eq(0)
      end
    end
  end
end
