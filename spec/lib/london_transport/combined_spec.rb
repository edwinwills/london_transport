require 'spec_helper'

RSpec.describe LondonTransport::Combined do
  subject { LondonTransport::Combined.new(longitude: -0.1440493, latitude: 51.5152117) }

  describe '#stations' do
    it 'returns oxford circus' do
      VCR.use_cassette("combined/stations") do
        expect(subject.stations[0]).to eq({
          'Oxford Circus Station  / Harewood Place' => {
            distance: 18.48103496643016,
            modes: ['bus'],
            lines: ['159', '23', '6', '7', '98', 'n7', 'n98']
          }
        })
      end
    end

    it 'returns bond street' do
      VCR.use_cassette("combined/stations") do
        expect(subject.stations[1]).to eq({
          'Oxford Street / John Lewis' => {
            distance: 67.4156503620209,
            modes: ['bus'],
            lines: ['13', '139', '189', 'n113', 'n13']
          }
        })
      end
    end

    it 'returns 3 stations' do
      VCR.use_cassette("combined/stations") do
        expect(subject.stations.count).to eq(3)
      end
    end
  end
end
