require 'spec_helper'

RSpec.describe LondonTransport::Bus do
  subject { LondonTransport::Bus.new(longitude: -0.1440493, latitude: 51.5152117) }

  describe '#stations' do
    it 'returns oxford circus / harewood place' do
      VCR.use_cassette("bus/stations") do
        expect(subject.stations[0]).to eq({
          'Oxford Circus Station  / Harewood Place' => BigDecimal.new('18.481034966430158')
        })
      end
    end

    it 'returns oxford circus station' do
      VCR.use_cassette("bus/stations") do
        expect(subject.stations[1]).to eq({
          'Oxford Circus Station' => BigDecimal.new('40.335619404365254')
        })
      end
    end

    it 'returns oxford circus' do
      VCR.use_cassette("bus/stations") do
        expect(subject.stations[2]).to eq({
          'Oxford Circus' => BigDecimal.new('63.475848157957415')
        })
      end
    end

    it 'returns 3 stations' do
      VCR.use_cassette("bus/stations") do
        expect(subject.stations.count).to eq(3)
      end
    end
  end
end
