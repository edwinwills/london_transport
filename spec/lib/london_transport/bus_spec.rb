require 'spec_helper'

RSpec.describe LondonTransport::Bus do
  subject { LondonTransport::Bus.new(longitude: -0.1440493, latitude: 51.5152117) }

  describe '#stations' do
    it 'returns oxford circus / harewood place' do
      VCR.use_cassette("bus/stations") do
        expect(subject.stations[0]).to eq({
          'Oxford Circus Station  / Harewood Place' => {
            distance: 18.48103496643016,
            modes: ['bus'],
            lines: ['159', '23', '6', '7', '98', 'n7', 'n98']
          }
        })
      end
    end

    it 'returns oxford circus station' do
      VCR.use_cassette("bus/stations") do
        expect(subject.stations[1]).to eq({
          'Oxford Circus Station' => {
            distance: 40.335619404365254,
            modes: ['bus'],
            lines: ['137', '189', 'n137']
          }
        })
      end
    end

    it 'returns oxford circus' do
      VCR.use_cassette("bus/stations") do
        expect(subject.stations[2]).to eq({
          'Oxford Circus' => {
            distance: 63.475848157957415,
            modes: ['bus'],
            lines: ['55', 'n109', 'n136', 'n55']
          }
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
