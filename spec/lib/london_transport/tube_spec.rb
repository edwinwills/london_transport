require 'spec_helper'

RSpec.describe LondonTransport::Tube do
  subject { LondonTransport::Tube.new(longitude: -0.1440493, latitude: 51.5152117) }

  describe '#stations' do
    it 'returns oxford circus' do
      VCR.use_cassette("tube/stations") do
        expect(subject.stations[0]).to eq({
          'Oxford Circus Underground Station' => 147.70533261648208
        })
      end
    end

    it 'returns bond street' do
      VCR.use_cassette("tube/stations") do
        expect(subject.stations[1]).to eq({
          'Bond Street Underground Station' => 403.48258984823457
        })
      end
    end

    it 'returns 2 stations' do
      VCR.use_cassette("tube/stations") do
        expect(subject.stations.count).to eq(2)
      end
    end
  end
end
